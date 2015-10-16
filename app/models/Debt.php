<?php

class Debt extends Phalcon\Mvc\Model
{
 
	public $id;
	
	public $fid;
	
	public $src;
	
	public $title;
	
	public $type;
	
    public function initialize()
    {
		$this->setConnectionService('customersystem');
		
        $this->belongsTo('fid', 'Debts', 'id', array(
			'reusable' => true
		));
    }

}
