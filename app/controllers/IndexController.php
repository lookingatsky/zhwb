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
			"limit" => 5,
			"order" => "id asc"
		));		
		$this->view->indexProducts = $indexProducts;
		
		$this->view->setVar("news1",$news1);
		$this->view->setVar("news2",$news2);
		$this->view->setVar("news3",$news3);
		$this->view->setVar("news4",$news4);
    }

	public function verifycodeAction(){
		$this->view->disable();
		$verifycode = new Verifycode();
		$result = $verifycode->getCode();
		return $result;
	}
	
	public function getdataAction(){
		$this->view->disable();
		if($this->request->isPost()) {
			$infos = $this->request->getPost();
			$appointment = new Appointment();
			$appointment->custName = $infos['res_custName'];
			$appointment->mobile = $infos['res_mobile'];
			$appointment->telephone = $infos['res_telephone'];
			$appointment->email = $infos['res_email'];
			$appointment->postcode = $infos['res_postcode'];
			$appointment->custsex = $infos['res_custSex'];
			$appointment->address = $infos['res_address'];
			$appointment->type = 0;
			$appointment->time = time();
			if($appointment->save()){
				echo true;
			}else{
				echo false;
			}
		}else{
			$this->response->redirect("index/index");
		}
		
	}
}
