<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class Account extends model
{
    public function initialize()
    {
		//$this->setConnectionService('db');
       // $this->setConnectionService('mongo1');
    }
    public function validation()
    {
        $this->validate(new EmailValidator(array(
            'field' => 'email'
        )));
	   $this->validate(new UniquenessValidator(array(
            'field' => 'email',
            'message' => '邮箱被霸占了'
        )));
        $this->validate(new UniquenessValidator(array(
            'field' => 'username',
            'message' => '用户名被霸占了'
        )));
        if ($this->validationHasFailed() == true) {
            return false;
        }
    }
}
