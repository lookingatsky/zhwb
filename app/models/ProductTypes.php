<?php

class ProductTypes extends Phalcon\Mvc\Model
{
    /**
     * @var integer
     */
    public $id;

    /**
     * @var string
     */
    public $name;

    public function initialize()
    {
        $this->hasMany('id', 'Products', 'product_types_id', array(
        	'foreignKey' => array(
        		'message' => '无法删除类型，先删除该类型的产品'
        	)
        ));
    }
}
