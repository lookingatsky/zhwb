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
		$news1 = News::find(array(
			"typeid = 1",
			"order" => "inputtime desc",			
			"limit" => 5
		));
		$news2 = News::find(array(
			"typeid = 2",
			"order" => "inputtime desc",			
			"limit" => 5
		));
		$news3 = News::find(array(
			"typeid = 3",
			"order" => "inputtime desc",
			"limit" => 3
		));
		$news4 = News::find(array(
			"typeid = 4",
			"order" => "inputtime desc",
			"limit" => 5
		));

		$indexProducts = Products::find(array(
			"limit" => 4,
			"order" => "id asc"
		));		
		$this->view->indexProducts = $indexProducts;
		
		$this->view->setVar("news1",$news1);
		$this->view->setVar("news2",$news2);
		$this->view->setVar("news3",$news3);
		$this->view->setVar("news4",$news4);
    }
	
}
