<?php

class NewsController extends ControllerBase
{
    public function initialize()
    {
		Phalcon\Tag::setTitle('新闻');
        parent::initialize();
    }

    public function indexAction($id)
    {
		if($id){
			$detail = News::findFirst("id =".$id);
			$this->view->setVar("detail",$detail);
		}else{
			
			
		}
		
    }
}
