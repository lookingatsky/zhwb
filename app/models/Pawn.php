<?php

class Pawn extends Phalcon\Mvc\Model
{
 
	public $id;
	
	public $bid;
	
	public $src;
	
	public $title;
	
	public $type;
	
    public function initialize()
    {
		$this->setConnectionService('customersystem');
        $this->belongsTo('bid', 'Loan', 'id', array(
			'reusable' => true
		));
    }

}
