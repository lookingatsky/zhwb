<?php

class Newstype extends Phalcon\Mvc\Model
{
    public $id;

    public $name;

    public function initialize()
    {
        $this->hasMany('id', 'News', 'typeid', array(
        	'foreignKey' => array(
        		'message' => '新闻类型不能删除，请先删除对应的新闻'
        	)
        ));
    }
}
