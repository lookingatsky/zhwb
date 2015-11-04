<?php

use Phalcon\Events\Event,
	Phalcon\Mvc\User\Plugin,
	Phalcon\Mvc\Dispatcher,
	Phalcon\Acl;

/**
 * Security
 *
 * This is the security plugin which controls that users only have access to the modules they're assigned to
 */
class Security extends Plugin
{

	public function __construct($dependencyInjector)
	{
		$this->_dependencyInjector = $dependencyInjector;
	}

	public function getAcl()
	{
		if (!isset($this->persistent->acl)) {

			$acl = new Phalcon\Acl\Adapter\Memory();

			$acl->setDefaultAction(Phalcon\Acl::DENY);

			///
			$roles = array(
				'customer' => new Phalcon\Acl\Role('customer'),
				'guests' => new Phalcon\Acl\Role('Guests'),
				'admin' => new Phalcon\Acl\Role('admin')
			);
			foreach ($roles as $role) {
				$acl->addRole($role);
			}

			////
			$privateResources = array(
				'operate' => array('index', 'addnews', 'add')
			);
			foreach ($privateResources as $resource => $actions) {
				$acl->addResource(new Phalcon\Acl\Resource($resource), $actions);
			}
			
			////
			$userResources = array(
				'personal' => array('index', 'detail','loan')
			);
			foreach ($userResources as $resource => $actions) {
				$acl->addResource(new Phalcon\Acl\Resource($resource), $actions);
			}	
			
			/////
			$publicResources = array(
				'index' => array('index','verifycode','getdata'),
				'news' => array('index'),
				'about' => array('index','contact','culture'),
				'service' => array('index','method','mode'),
				'situation' => array('index'),
				'college' => array('index','case','test'),
				'account' => array('verify','register'),
				'session' => array('index','start','end')
				
			);
			foreach ($publicResources as $resource => $actions) {
				$acl->addResource(new Phalcon\Acl\Resource($resource), $actions);
			}

			//
			foreach ($roles as $role) {
				foreach ($publicResources as $resource => $actions) {
					$acl->allow($role->getName(), $resource, '*');
				}
			}

			foreach ($userResources as $resource => $actions) {
				foreach ($actions as $action){
					$acl->allow('customer', $resource, $action);
				}
			}			
			
			
			foreach ($privateResources as $resource => $actions) {
				foreach ($actions as $action){
					$acl->allow('admin', $resource, $action);
				}
			}
	
			//
			$this->persistent->acl = $acl;
		}

		return $this->persistent->acl;
	}


	public function beforeDispatch(Event $event, Dispatcher $dispatcher)
	{
		$auth = $this->session->get('auth');
		
		if (!$auth){
			$role = 'Guests';
		} else {
			$role = 'customer';
		}
		
		$controller = $dispatcher->getControllerName();
		$action = $dispatcher->getActionName();
		$acl = $this->getAcl();
		
		$allowed = $acl->isAllowed($role, $controller, $action);
		if ($allowed != Acl::ALLOW) {
			$this->flash->error("没有权限");
			$dispatcher->forward(
				array(
					'controller' => 'index',
					'action' => 'index'
				)
			);
			return false;
		}
		
	}

}
