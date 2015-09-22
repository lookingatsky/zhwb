<?php
use Phalcon\Mvc\Model\Criteria;

class IndexController extends ControllerBase
{
    public function initialize()
    {
        Phalcon\Tag::setTitle('欢迎');
        parent::initialize();
    }
	
    public function indexAction(){

    }
	
}
