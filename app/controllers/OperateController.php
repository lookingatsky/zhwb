<?php

use Phalcon\Tag;
use Phalcon\Mvc\Model\Criteria;

class OperateController extends ControllerBase
{
    public function initialize()
    {
        $this->view->setTemplateAfter('main');
        Tag::setTitle('新闻操作');
        parent::initialize();
    }

    public function indexAction()
    {
        //$this->persistent->searchParams = null;
		$Newstype = Newstype::find();
		$this->view->setVar("Newstype",$Newstype);
		
		
		$News = News::find();
		$this->view->setVar("News",$News);
		
/* 		$typeArr;
		$type = Type::find();
		foreach($type as $k=>$v){
			$types = Types::find("fid = '".$v->id."'");
			$typeArr[$v->name] = $types->toArray();
		}
		
		$auth = $this->session->get("auth");
		if($auth['did'] != 0){
			Tag::setDefault("company", $auth['did']);
		}
		$this->view->setVar('did',$auth['did']);
		$this->view->setVar("typeArr",$typeArr);	 */	
    }
	
	public function addnewsAction(){
		$Newstype = Newstype::find();
		$this->view->setVar("Newstype",$Newstype);		
	}
	
	public function editnewsAction($id){
		$id = $this->filter->sanitize($id, array("int"));	
		if($id){
			$Newstype = Newstype::find();
			$this->view->setVar("Newstype",$Newstype);
			
			$news = News::findFirst("id =".$id);
			if($news){
				Tag::setDefault("newsid",$news->id);
				Tag::setDefault("typeid",$news->typeid);	
				Tag::setDefault("title",$news->title);	
				Tag::setDefault("description",$news->description);	
				Tag::setDefault("content",$news->content);	
				if($news->thumb){
					$this->view->thumb = $news->thumb;
				}
			}else{
				$this->response->redirect("index/index");
			}
			
		}else{
			$this->response->redirect("index/index");
		}
	}
	
	public function saveAction(){
		
		$id = $this->request->getPost("id", "int");
		
		$finance = Finance::findFirstById($id);
		
		if (!$finance) {
            $this->flash->error("没找到对应的录入信息");
            return $this->forward("product/index");			
		}	
			
		$request = $this->request->getPost();
		//$finance = new Finance();
		
		$finance->data = json_encode($request);
		$finance->time = time(); 
		$finance->did = $request['company'];
		$finance->d_name = $finance->department->name;
		if($finance->save()){
			$this->flash->notice("保存成功！");
		}else{
			$this->flash->error("保存失败！");
		}
		$this->response->redirect('products/list');
	}
	
	public function listAction(){	
        $request = $this->request->getPost();	
		$departments = Department::find();
		$this->view->setVar("departments",$departments);
      
		$typeArr;
		$type = Type::find();
		foreach($type as $k=>$v){
			$types = Types::find("fid = '".$v->id."'");
			$typeArr[$v->name] = $types->toArray();
		}
		$this->view->setVar("typeArr",$typeArr);
			
		$ids =  '';	
		$parameters = array();	
		
		$auth = $this->session->get("auth");
		if($auth['did'] == 0){		
			if(isset($request['company']) && $request['company'] != '' ){
				foreach($request['company'] as $key=>$val){
					if($key >0 && $key<count($request['company'])){
						$ids .= " or ";
					}
					$ids .= 'did = '.$val;	
				}
				$parameters[] = $ids;
			}			
		}else{
			$parameters[] = 'did = '.$auth['did'];
		}

		$timeNow = date('Y-m-d',time());
		$this->view->setVar('timeNow',$timeNow);
		
 		if(isset($request['sTime']) && $request['sTime'] != ''){
			$timeLimit = 'time > '.strtotime($request['sTime']);
			$this->view->setVar('sTime',$request['sTime']);
		}
		
		if(isset($request['eTime']) && $request['eTime'] != ''){
			$timeLimit .= ' AND time < '.strtotime($request['eTime']);
			$this->view->setVar('eTime',$request['eTime']);
		}
		
		if(isset($timeLimit) && $timeLimit != ''){
			$parameters['conditions'] = $timeLimit;	
		}
		
		$listInfos = Finance::find($parameters);
		
		$this->view->setVar('listInfos',$listInfos);
		$this->view->setVar('did',$auth['did']);
		
	}
    public function searchAction()
    {
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Products", $_POST);
            $this->persistent->searchParams = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
            if ($numberPage <= 0) {
                $numberPage = 1;
            }
        }

        $parameters = array();
        if ($this->persistent->searchParams) {
            $parameters = $this->persistent->searchParams;
        }

        $products = Products::find($parameters);
        if (count($products) == 0) {
            $this->flash->notice("没找到任何类型");
            return $this->forward("products/index");
        }

        $paginator = new Phalcon\Paginator\Adapter\Model(array(
            "data" => $products,
            "limit" => 5,
            "page" => $numberPage
        ));
		
        $page = $paginator->getPaginate();
	
        $this->view->setVar("page", $page);
    }

    public function newAction()
    {
        $this->view->setVar("productTypes", ProductTypes::find());
    }

    public function editAction($id)
    {
        $request = $this->request;
        if (!$request->isPost()) {

            $id = $this->filter->sanitize($id, array("int"));

            $Finance = Finance::findFirst('id="' . $id . '"');
            if (!$Finance) {
                $this->flash->error("这条记录没有找到！");
                return $this->forward("products/list");
            }
			
			$departments = Department::find();
			$this->view->setVar("departments",$departments);

			Tag::displayTo("company", $Finance->did);
			
			$typeArr;
			$type = Type::find();
			foreach($type as $k=>$v){
				$types = Types::find("fid = '".$v->id."'");
				$typeArr[$v->name] = $types->toArray();
			}
			$this->view->setVar("typeArr",$typeArr);				
			
            $this->view->setVar("id", $Finance->id);
			
			$datas = json_decode($Finance ->data,true); 
			
			foreach($typeArr as $key=>$val){
				foreach($val as $k=>$v){
					if(isset($datas['cost'][$v['name']]) && $datas['cost'][$v['name']] != ''){
						Tag::displayTo("cost[".$v['name']."]", $datas['cost'][$v['name']]);						
					}
					if(isset($datas['remark'][$v['name']]) && $datas['remark'][$v['name']] != ''){
						Tag::displayTo("remark[".$v['name']."]", $datas['remark'][$v['name']]);
					} 
					if(isset($datas['limit'][$v['name']]) && $datas['limit'][$v['name']] != ''){
						Tag::displayTo("limit[".$v['name']."]", $datas['limit'][$v['name']]);
					}
				}
			}

			Tag::displayTo("id", $Finance->id);
			
			$auth = $this->session->get("auth");
			if($auth['did'] != 0){
				Tag::setDefault("company", $auth['did']);
			}
			$this->view->setVar('did',$auth['did']);
/*             
            Tag::displayTo("product_types_id", $products->product_types_id);
            Tag::displayTo("name", $products->name);
            Tag::displayTo("price", $products->price);
            Tag::displayTo("active", $products->active); 
            $this->view->setVar("productTypes", ProductTypes::find());			
			*/
        }
    }
	
/*     public function createAction()
    {
		$auth = $this->session->get('auth');
		
		$request = $this->request;
		
        if (!$request->isPost()) {
            return $this->forward("products/index");
        }	
		$request = $request->getPost();
		$finance = new Finance();	
		$finance->data = json_encode($request);	
		$finance->time = time(); 		
		$finance->did = $request['company'];
		$finance->d_name = $finance->department->name;
		$finance->registrar = $auth['name'];
		
		if($finance->save()){
			$this->flash->notice("保存成功！");
		}else{
			$this->flash->error("保存失败！");
		}
		$this->response->redirect('products/list');		
		
    } */
	
	public function addAction(){
		$request = $this->request;
		if (!$request->isPost()) {
			
		}
		$this->view->disable();
		//判断是编辑还是添加
		if($request->getPost("newsid") != ''){
			$news = News::findFirst("id =".$request->getPost("newsid"));
			if ($this->request->hasFiles('fileDataFileName') == true) {
				$fileName = date('Ymd');
				
				if (!file_exists(APP_PATH.'/public/files/'.$fileName)){ 
					mkdir(APP_PATH.'/public/files/'.$fileName); 
				}	 		
				
				foreach ($this->request->getUploadedFiles() as $file) {

					$getType = explode('.',$file->getName());
					$imageName = date('YmdHis').".".$getType[count($getType)-1];
					
					if($getType[count($getType)-1] != ''){
						$file->moveTo(APP_PATH.'/public/files/'.$fileName.'/'.$imageName);
						$news->thumb = '/files/'.$fileName.'/'.$imageName;
					}
				}
				
			}
			$news->typeid = $request->getPost("typeid");
			$news->title = $request->getPost("title");
			$news->description = $request->getPost("description");
			$news->content = $request->getPost("content");
			if($news->save()){
				$this->flash->notice("保存成功！");
			}else{
				foreach ($news->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
			}				
		}else{
			$news = new News();
			if ($this->request->hasFiles('fileDataFileName') == true) {
				$fileName = date('Ymd');
				if (!file_exists(APP_PATH.'/public/files/'.$fileName)){ 
					mkdir(APP_PATH.'/public/files/'.$fileName); 
				}	 		
				
				foreach ($this->request->getUploadedFiles() as $file) {

					$getType = explode('.',$file->getName());
					$imageName = date('YmdHis').".".$getType[count($getType)-1];
					if($getType[count($getType)-1] != ''){
						$file->moveTo(APP_PATH.'/public/files/'.$fileName.'/'.$imageName);
						$news->thumb = '/files/'.$fileName.'/'.$imageName;
					}else{
						$news->thumb = '/img/test.jpg';
					}
				}
			}
			
			$news->typeid = $request->getPost("typeid");
			$news->title = $request->getPost("title");
			$news->description = $request->getPost("description");
			$news->content = $request->getPost("content");
			$news->username = 'admin';
			$news->inputtime = time();
			$news->updatetime = time();
			$news->status = 0;
			if($news->save()){
				$this->flash->notice("保存成功！");
			}else{
				foreach ($news->getMessages() as $message) {
					$this->flash->error((string) $message);
				}
			}			
		}
	}
	
	public function uploadAction(){
		$this->view->disable();
		if ($this->request->hasFiles() == true) {

            foreach ($this->request->getUploadedFiles() as $file) {

                $file->moveTo(APP_PATH.'/public/files/' . $file->getName());
				
				$data['success'] = true;
				$data['msg'] = '上传成功';
				$data['file_path'] = '/../../files/'.$file->getName();
				$msg = json_encode($data);
            }
			echo $msg;
        }
	}

/*     public function saveAction()
    {
        $request = $this->request;
        if (!$request->isPost()) {
            return $this->forward("products/index");
        }

        $id = $request->getPost("id", "int");
        $products = Products::findFirst("id='$id'");
        if ($products == false) {
            $this->flash->error("products does not exist ".$id);
            return $this->forward("products/index");
        }

        $products->id = $request->getPost("id", "int");
        $products->product_types_id = $request->getPost("product_types_id", "int");
        $products->name = $request->getPost("name");
        $products->price = $request->getPost("price");
        $products->active = $request->getPost("active");

        $products->name = strip_tags($products->name);

        if (!$products->save()) {
            foreach ($products->getMessages() as $message) {
                $this->flash->error((string) $message);
            }

            return $this->forward("products/edit/" . $products->id);
        } else {
            $this->flash->success("Product was successfully updated");
            return $this->forward("products/index");
        }
    } */

    public function deleteAction($id)
    {
        $id = $this->filter->sanitize($id, array("int"));

        $products = Finance::findFirst('id="' . $id . '"');
        if (!$products) {
            $this->flash->error("没有找到对应的记录");
            return $this->forward("products/index");
        }
			
        if (!$products->delete()) {
            foreach ($products->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->forward("products/search");
        } else {
            $this->flash->success("记录已删除");
            return $this->forward("products/index");
        }
    }
	
	public function changetypesAction($id){
		if($id){
			$newstype = Newstype::findFirst("id =".$id);
			Tag::displayTo("id",$newstype->id);
			Tag::displayTo("name",$newstype->name);
		}else{
			 $this->flash->error("错误");
		}
		
	}
	
	public function  savetypesAction(){
		$id = $this->request->getPost("id");
		$newtypes = Newstype::findFirst("id =".$id);
		$newtypes->name = $this->request->getPost("name");
		if($newtypes->save()){
			$this->flash->notice("保存成功！");
		}else{
			foreach ($newtypes->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
		}
	}
	
}
