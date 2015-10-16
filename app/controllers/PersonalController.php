<?php

use Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Textarea,
	Phalcon\Forms\Element\Hidden;

class PersonalController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('个人信息');
        parent::initialize();
    }

    public function indexAction()
    {
		$auth = $this->session->get("auth");
		$id = $auth['cid'];
		
		$searchParams = array();
		$searchParams = array("id = '".$id."'");
			
		$customer = Customer::findFirst($searchParams);
		$this->view->setVar("customer", $customer);
			
		$debts = Debts::find("cid = ".$id);
		if (count($customer) == 0) {
			$this->flash->notice("没有找到对应的债权信息");
		}

		$paginator = new Phalcon\Paginator\Adapter\Model(array(
			"data" => $debts,
			"limit" => 10,
			"page" => $numberPage
		));
		$page = $paginator->getPaginate();	
			
		$this->view->page = $page;
		$this->view->setVar("uid", $id);
			
		$account = Account::findFirst("cid = ".$id);
		if(isset($account->id)){
			$this->view->hasAccount = 1;
		}else{
			$this->view->hasAccount = 0;
		}		
    }
	
	public function detailAction($id)
	{
		$id = $this->filter->sanitize($id, array("int"));
		
		if($id){
			$searchParams = array("id = '".$id."'");
			
			$debts = Debts::findFirst($searchParams);
			$this->view->setVar("debts", $debts);
			
			$debt = Debt::find("fid = ".$id);
			$this->view->debt = $debt;
		}else{
			$this->flash->error("没有找到对应的债权");
			return $this->forward("debt/index");
		}	
	}
	
}
