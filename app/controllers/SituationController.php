<?php
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class SituationController extends ControllerBase
{
    public function initialize()
    {
        Phalcon\Tag::setTitle('公司动态');
        parent::initialize();
    }
	
    public function indexAction(){
		$dynamicPageBegin = $this->request->getPost("dynamicPageBegin");
		$mediaPageBegin = $this->request->getPost("mediaPageBegin");
		$schdPageBegin = $this->request->getPost("schdPageBegin");
		
		$type =	$this->request->getQuery("type");
		if($type == ''){
			$type =	$this->request->getPost("type");	
		}
		if($type == ''){
			$type = 'X_WXX';
		}
		$this->view->setVar("type",$type);
		
		
		
/*		$news1 = News::find(array(
			"typeid = 1",
			"limit" => 5
		));
		$news2 = News::find(array(
			"typeid = 2",
			"limit" => 5
		));
 		$news3 = News::find(array(
			"typeid = 3",
			"order" => "inputtime desc",
			"limit" => array(
				"number" => 3,
				"offset" => 0
			)
		)); */
		
		
		$news1 = News::find(array(
			"typeid = 1",
			"order" => "inputtime desc"
		));

		$paginator1 = new \Phalcon\Paginator\Adapter\Model(
			array(
				"data" => $news1,
				"limit"=> 6,
				"page" => $dynamicPageBegin
			)
		);
		
		$news2 = News::find(array(
			"typeid = 2",
			"order" => "inputtime desc"
		));

		$paginator2 = new \Phalcon\Paginator\Adapter\Model(
			array(
				"data" => $news2,
				"limit"=> 10,
				"page" => $mediaPageBegin
			)
		);		

		$news3 = News::find(array(
			"typeid = 3",
			"order" => "inputtime desc"
		));

		$paginator = new \Phalcon\Paginator\Adapter\Model(
			array(
				"data" => $news3,
				"limit"=> 3,
				"page" => $schdPageBegin
			)
		);

		$this->view->page1 = $paginator1->getPaginate();
		$this->view->page2 = $paginator2->getPaginate();
		$this->view->page = $paginator->getPaginate();
		
		//$this->view->setVar("news3",$news3);		
    }
	
}
