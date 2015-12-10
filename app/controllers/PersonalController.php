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
    }
	
	public function highchartAction($id){
		$auth = $this->session->get("auth");
		$id = $auth['cid'];
		
		$searchParams = array();
		$searchParams = array("id = '".$id."'");	
		
		$debts = Debts::find(array(
			"cid = ".$id,
			"order" => "pay_time desc"
		));
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
		//查找客户信息
		$customer = Customer::findFirst($searchParams);
		$this->view->setVar("customer", $customer);		
	}
	
	public function loanAction(){
/* 		$id = $this->filter->sanitize($id, array("int"));
		
		if($id){
			$searchParams = array("id = '".$id."'");
			
			$loan = Loan::findFirst($searchParams);
			$this->view->setVar("loan", $loan);
			
			$pawn = Pawn::find("bid = ".$id);
			$this->view->pawn = $pawn;
		}else{
			$this->flash->error("没有找到对应的借款");
			return $this->forward("loan/index");
		}	 */	
		$auth = $this->session->get("auth");
		$id = $auth['cid'];
		
		$searchParams = array();
		$searchParams = array("id = '".$id."'");	
		
		$debts = Debts::find(array(
			"cid = ".$id,
			"order" => "pay_time desc"
		));
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
			
/* 		$account = Account::findFirst("cid = ".$id);
		if(isset($account->id)){
			$this->view->hasAccount = 1;
		}else{
			$this->view->hasAccount = 0;
		}	 */			
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
			$this->view->website = FILEWEBNAME ;
			$match = Match::find("debt_number  = '".$debts->number ."'");
			$this->view->match = $match;
			
			foreach($match as $key=>$val){
				
			}
			
			fb($match->toArray());
		}else{
			$this->flash->error("没有找到对应的债权");
			return $this->forward("debt/index");
		}	
	}	
}
