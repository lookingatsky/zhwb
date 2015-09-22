<?php
use Phalcon\Mvc\Model\Criteria;

class SituationController extends ControllerBase
{
    public function initialize()
    {
        Phalcon\Tag::setTitle('万邦动态');
        parent::initialize();
    }
	
    public function indexAction(){
		$type =	$this->request->getQuery("type");
		if($type == ''){
			$type = 'X_WXX';
		}
		$this->view->setVar("type",$type);
    }
	
}
