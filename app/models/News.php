<?php

class News extends Phalcon\Mvc\Model
{
    public $id;
    public $typeid;

    public function initialize()
    {
        $this->belongsTo('typeid', 'Newstype', 'id', array(
			'reusable' => true
		));
    }

}
