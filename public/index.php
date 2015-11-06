<?php
//error_reporting(E_ALL);
error_reporting(E_ALL^E_NOTICE);
try {
	//require_once 'FirePHP/fb.php';
	/**
	 * Read the configuration
	 */
	define('APP_PATH', realpath('..') . '/');
	define('LOGS_PATH', realpath('..') . '/logs/');	 
	 
	$config = new Phalcon\Config\Adapter\Ini(__DIR__ . '/../app/config/config.ini');
	define('FILEWEBNAME',$config->webservice->filewebname);
	
	$loader = new \Phalcon\Loader();

	/**
	 * We're a registering a set of directories taken from the configuration file
	 */
	$loader->registerDirs(
		array(
			__DIR__ . $config->application->controllersDir,
			__DIR__ . $config->application->pluginsDir,
			__DIR__ . $config->application->libraryDir,
			__DIR__ . $config->application->modelsDir,
			__DIR__ . $config->application->formsDir,
		)
	)->register();

	$di = new \Phalcon\DI\FactoryDefault();

	$di->set('dispatcher', function() use ($di) {

		$eventsManager = $di->getShared('eventsManager');
			
		//$security = new \Phalcon\Security($di);
		$security = new Security($di);
		
		$eventsManager->attach('dispatch', $security);
		$dispatcher = new Phalcon\Mvc\Dispatcher();
		$dispatcher->setEventsManager($eventsManager);
		return $dispatcher;
	});


	$di->set('url', function() use ($config){
		$url = new \Phalcon\Mvc\Url();
		$url->setBaseUri($config->application->baseUri);
		return $url;
	});


	$di->set('view', function() use ($config) {

		$view = new \Phalcon\Mvc\View();

		$view->setViewsDir(__DIR__ . $config->application->viewsDir);

		$view->registerEngines(array(
			".volt" => 'volt'
		));

		return $view;
	});

	/**
	 * Setting up volt
	 */
	$di->set('volt', function($view, $di) {

		$volt = new \Phalcon\Mvc\View\Engine\Volt($view, $di);

		$volt->setOptions(array(
			"compiledPath" => "../cache/volt/"
		));

		return $volt;
	}, true);

	/**
	 *
	 */
	$di->set('db', function() use ($config) {
		return new \Phalcon\Db\Adapter\Pdo\Mysql(array(
			"host" => $config->database->host,
			"username" => $config->database->username,
			"password" => $config->database->password,
			"dbname" => $config->database->name
		));
	});

	$di->set('customersystem', function() use ($config) {
		return new \Phalcon\Db\Adapter\Pdo\Mysql(array(
			"host" => $config->database2->host,
			"username" => $config->database2->username,
			"password" => $config->database2->password,
			"dbname" => $config->database2->name
		));
	});	
	
	$di->set('collectionManager', function() {
		//$eventsManager = new Phalcon\Events\Manager();
		/*
		$eventsManager->attach('collection',function($event,$model){
			if(get_class($model) == 'Robots'){
				if($event->getType() == 'beforeSave'){
					if($model->name == ''){
						echo '';
						return false;
					} 
				}
			}
			return true;	
		});
		*/
		$modelsManager = new Phalcon\Mvc\Collection\Manager();
		//$modelsManager->setEventsManager($eventsManager);
		return $modelsManager;

	}, true);
	
	/**
	 *
	 */
	$di->set('modelsMetadata', function() use ($config) {
		if (isset($config->models->metadata)) {
			$metaDataConfig = $config->models->metadata;
			$metadataAdapter = 'Phalcon\Mvc\Model\Metadata\\'.$metaDataConfig->adapter;
			return new $metadataAdapter();
		}
		return new Phalcon\Mvc\Model\Metadata\Memory();
	});

	/**
	 *
	 */
	$di->set('session', function(){
		$session = new Phalcon\Session\Adapter\Files();
		$session->start();
		return $session;
	});

	/**
	 *
	 */
	$di->set('flash', function(){
		return new Phalcon\Flash\Direct(array(
			'error' => 'alert alert-error',
			'success' => 'alert alert-success',
			'notice' => 'alert alert-info',
		));
	});

	/**
	 *
	 */
	$di->set('elements', function(){
		return new Elements();
	});

	$application = new \Phalcon\Mvc\Application();
	$application->setDI($di);
	echo $application->handle()->getContent();

} catch (Phalcon\Exception $e) {
	echo $e->getMessage();	
} catch (PDOException $e){
	echo $e->getMessage();
}