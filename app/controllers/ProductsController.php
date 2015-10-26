<?php
use Phalcon\Tag;
use Phalcon\Mvc\Model\Criteria;
class ProductsController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('产品操作');
        parent::initialize();
    }
    public function indexAction()
    {
    }
    public function newAction()
    {
        $this->view->setVar("productTypes", ProductTypes::find());
    }
    public function createAction()
    {
		$auth = $this->session->get('auth');
		
		$request = $this->request;
		
        if (!$request->isPost()) {
            return $this->forward("products/index");
        }	
		$request = $request->getPost();
		$products = new Products();	
		$products->product_types_id = $request['product_types_id'];	
		$products->name = $request['name'];	
		$products->issuer = $request['issuer'];	
		$products->status = $request['status'];	
		$products->cycle = $request['cycle'];	
		$products->min = $request['min'];	
		$products->expected = $request['expected'];	
		$products->issuetime = $request['issuetime'];	
		$products->telephone = $request['telephone'];	
		$products->control = $request['control'];
		$products->description = $request['description'];	
		$products->registrar = $auth['name'];
		
		if($products->save()){
			$this->flash->notice("保存成功！");
			return $this->forward('products/new');
		}else{
			foreach ($products->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
		}
    }
	
    public function searchAction()
    {
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Products", $_POST);
            $this->persistent->searchParams = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
            if ($numberPage <= 0) {
                $numberPage = 1;
            }
        }
        $parameters = array();
        if ($this->persistent->searchParams) {
            $parameters = $this->persistent->searchParams;
        }
        $products = Products::find($parameters);
        if (count($products) == 0) {
            $this->flash->notice("没找到任何类型");
            return $this->forward("products/index");
        }
        $paginator = new Phalcon\Paginator\Adapter\Model(array(
            "data" => $products,
            "limit" => 5,
            "page" => $numberPage
        ));
		
        $page = $paginator->getPaginate();
	
        $this->view->setVar("page", $page);
    }
	public function addtypeAction(){
		
		
	}
	
	public function createtypeAction(){
		
		$request = $this->request;
		
        if (!$request->isPost()) {
            return $this->forward("products/addtype");
        }	
		$request = $request->getPost();
		$producttypes = new ProductTypes();	
		$producttypes->name = $request['name'];	
		
		if($producttypes->save()){
			$this->flash->notice("保存成功！");
			return $this->forward('products/addtype');
		}else{
			foreach ($products->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
		}		
	}
}