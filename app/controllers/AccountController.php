<?php
use Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Textarea,
	Phalcon\Forms\Element\Hidden;
use Phalcon\Logger\Adapter\File as FileAdapter;	

class AccountController extends ControllerBase
{
    public function initialize()
    {
		//$this->view->setTemplateAfter('main');	
        Phalcon\Tag::setTitle('验证信息');
        parent::initialize();
    }

    public function indexAction()
    {
		
    }

	public function verifyAction($code){
		if($code){
			$results = VerifyEmail::FindFirst("verifyCode = '".$code."'");
		if(!isset($results->cid)){
			return $this->response->redirect("index/index");
		}
			$form = new RegisterForm;
			
			if(isset($results) && $results != ''){
				if($results->active == 'Y'){
					if(md5($results->time.'+'.$results->email) == $code){
						$this->view->form = $form;
						Tag::setDefault('password',null);
						Tag::setDefault('cid',$results->cid);
						Tag::setDefault('email',$results->email);
						$this->view->setVar("email", $results->email);
					}else{
						$this->flash->error('邮箱验证错误！');
						$this->response->redirect("account/index");					
					}					
				}else{
					$this->flash->error('邮箱已经验证通过，请登录！');
					$this->response->redirect("account/index");
				}
			}else{
				$this->flash->error('验证码已过期！');
				$this->response->redirect("index/index"); 
			}
		}else{
			$this->response->redirect("index/index");
		}		
	}
	
	public function registerAction(){
		if ($this->request->isPost()) {
			
			$request = $this->request->getPost();
			$password = $request['password'];
	        $repeatPassword = $request['repeatPassword'];
			$cid = $request['cid'];
			
			if ($password != $repeatPassword) {
                $this->flash->error('两次密码不一致');
                return false;
            }		
			$customer = Customer::findFirst("id = ".$cid);
			$hasVerified = VerifyEmail::find("email = '".$request['email']."'");
			foreach($hasVerified as $val){
				$val->active = "N";
				$val->save();					
			}

			
			$account = new Account();
			$account->username = $customer->name;
			$account->password = sha1($password);
			$account->email = $request['email'];
			$account->cellphone = $customer->cellphone;
			$account->created_at = new Phalcon\Db\RawValue('now()');
			$account->active = "Y";
			$account->cid = $cid;
			
			if ($account->save() == false) {
				$this->flash->error('保存失败');
				foreach ($account->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
			} else {
				$this->_registerSession($account);
                return $this->response->redirect('personal/index');
			}			
			
		}
	}
	
    private function _registerSession($user)
    {
        $this->session->set('auth', array(
            'id' => $user->id,
            'name' => $user->username,
			'cid' => $user->cid
        ));
		
    } 	
}
