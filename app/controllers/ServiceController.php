<?php
use Phalcon\Paginator\Adapter\Model as Paginator;

class ServiceController extends ControllerBase
{
    public function initialize()
    {
        Phalcon\Tag::setTitle('产品与服务');
        parent::initialize();
    }

    public function indexAction(){
		$indexProducts = Products::find(array(
			"limit" => 5,
			"order" => "id asc"
		));
		
		$products = Products::find(array(
			"order" => "id asc"
		));
		
		$paginator = new \Phalcon\Paginator\Adapter\Model(
			array(
				"data" => $products,
				"limit"=> 8,
				"page" => $dynamicPageBegin
			)
		);		
		$this->view->page = $paginator->getPaginate();
		$this->view->indexProducts = $indexProducts;
    }
	
	public function infosAction(){
		
	}
	
	public function methodAction(){
		
	}
	
	public function modeAction(){
		
	}
	
	public function productAction($id){
		if($id){
			$product = Products::findFirst("id =".$id);
			$this->view->product = $product;
		}else{
			$this->response->redirect("/service/index");
		}
	}
}
