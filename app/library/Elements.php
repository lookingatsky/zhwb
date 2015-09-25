<?php

/**
 * Elements
 *
 * Helps to build UI elements for the application
 */
class Elements extends Phalcon\Mvc\User\Component
{

    private $_headerMenu = array(
        'pull-left' => array(
            'index' => array(
                'caption' => '首 页',
                'action' => 'index'
            ),
             'invoices' => array(
                'caption' => '系 统',
                'action' => 'index'
            ),
             'help' => array(
                'caption' => '帮助中心',
                'action' => 'index'
            ),			
/*            'about' => array(
                'caption' => '关于',
                'action' => 'index'
            ),
            'contact' => array(
                'caption' => '联系我们',
                'action' => 'index'
            ), */
        ),
        'pull-right' => array(
			'invoices' => array(
				'caption' => '',
				'action' => 'index'
			),
            'session' => array(
                'caption' => '登 录',
                'action' => 'index'
            ),
        )
    );

    private $_tabs = array(
        '新闻操作' => array(
            'controller' => 'operate',
            'action' => 'index',
            'any' => false
        ),
        '部门管理' => array(
            'controller' => 'companies',
            'action' => 'index',
            'any' => true
        ),
        '信息录入' => array(
            'controller' => 'products',
            'action' => 'index',
            'any' => true
        ),
        '类型管理' => array(
            'controller' => 'producttypes',
            'action' => 'index',
            'any' => true
        ),
/*        '客户管理' => array(
            'controller' => 'customer',
            'action' => 'index',
            'any' => true
        ),
*/		
        '账户管理' => array(
            'controller' => 'invoices',
            'action' => 'profile',
            'any' => false
        )
    );

    /**
     * Builds header menu with left and right items
     *
     * @return string
     */
    public function getMenu()
    {

        $auth = $this->session->get('auth');
        if ($auth) {
		
            $this->_headerMenu['pull-right']['session'] = array(
                'caption' => '退 出',
                'action' => 'end'
            );
            $this->_headerMenu['pull-right']['invoices'] = array(
                'caption' => "欢迎您！ ".$auth['name'],
                'action' => 'profile'
            );				
        } else {
            unset($this->_headerMenu['pull-left']['invoices']);
        }

        echo '<div class="nav-collapse">';
        $controllerName = $this->view->getControllerName();
        foreach ($this->_headerMenu as $position => $menu) {
            echo '<ul class="nav ', $position, '">';
            foreach ($menu as $controller => $option) {
                if ($controllerName == $controller) {
                    echo '<li class="active">';
                } else {
                    echo '<li>';
                }
                echo Phalcon\Tag::linkTo($controller.'/'.$option['action'], $option['caption']);
                echo '</li>';
            }
            echo '</ul>';
        }
        echo '</div>';
    }

    public function getTabs()
    {
        $controllerName = $this->view->getControllerName();
        $actionName = $this->view->getActionName();
        echo '<ul class="nav nav-tabs">';
        foreach ($this->_tabs as $caption => $option) {
            if ($option['controller'] == $controllerName && ($option['action'] == $actionName || $option['any'])) {
                echo '<li class="active">';
            } else {
                echo '<li>';
            }
            echo Phalcon\Tag::linkTo($option['controller'].'/'.$option['action'], $caption), '<li>';
        }
        echo '</ul>';
    }
}
