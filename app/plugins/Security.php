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
				'companies' => array('index', 'search', 'new', 'edit', 'save', 'create', 'delete','account','accountsave',"accountdelete"),
				'products' => array('index', 'search', 'new', 'edit', 'save', 'create', 'delete','list'),
				'producttypes' => array('index', 'search', 'new', 'edit', 'save', 'create', 'delete','child','savetypes','edittypes','newtypes','createtypes','deletetypes'),
				'invoices' => array('index', 'profile'),
				'register' => array('index','sendemail','verifyemail','register'),
				'customer' => array('index','detail')
			);
			foreach ($privateResources as $resource => $actions) {
				$acl->addResource(new Phalcon\Acl\Resource($resource), $actions);
			}
			
			////
			$userResources = array(
				'invoices' => array('index', 'profile'),
				'products' => array('index', 'search', 'new', 'edit', 'save', 'create', 'delete','list'),
				'register' => array('verifyemail','register')
			);
			foreach ($userResources as $resource => $actions) {
				$acl->addResource(new Phalcon\Acl\Resource($resource), $actions);
			}	
			
			/////
			$publicResources = array(
				'index' => array('index'),
				'about' => array('index','contact','culture'),
				'service' => array('index','method','mode'),
				'situation' => array('index'),
				'college' => array('index','case','test')
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
					$acl->allow('Users', $resource, $action);
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
			if($auth['did'] == 0){
				$role = 'admin';
			}else{
				$role = 'Users';				
			}
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
