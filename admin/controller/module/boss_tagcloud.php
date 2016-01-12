<?php
class ControllerModuleBossTagCloud extends Controller {
	private $error = array();
    
	public function index() {
		$this->load->language('module/boss_tagcloud');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('extension/module');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
				
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('boss_tagcloud', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}
			$this->session->data['success'] = $this->language->get('text_success');
		
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_normal'] = $this->language->get('text_normal');
		$data['text_bold'] = $this->language->get('text_bold');		
		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_yes'] = $this->language->get('entry_yes'); 
		$data['entry_no']	= $this->language->get('entry_no');
		
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_min_font_size'] = $this->language->get('entry_min_font_size');
		$data['entry_max_font_size'] = $this->language->get('entry_max_font_size');
		$data['entry_font_weight'] = $this->language->get('entry_font_weight');
		$data['entry_status'] = $this->language->get('entry_status');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/banner', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/boss_tagcloud', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);			
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/boss_tagcloud', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/boss_tagcloud', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}
   		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}	
			
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
		if (isset($this->error['limit'])) {
			$data['error_limit'] = $this->error['limit'];
		} else {
			$data['error_limit'] = '';
		}
		if (isset($this->error['min_font_size'])) {
			$data['error_min_font_size'] = $this->error['min_font_size'];
		} else {
			$data['error_min_font_size'] = '';
		}
		if (isset($this->error['max_font_size'])) {
			$data['error_max_font_size'] = $this->error['max_font_size'];
		} else {
			$data['error_max_font_size'] = '';
		}
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
        
        $data['font_weights'] = array();
			
		$data['font_weights'][] = array(
			'font_weight' => 'normal',
			'title'    => $this->language->get('text_normal')
		);

		$data['font_weights'][] = array(
			'font_weight' => 'bold',
			'title'    => $this->language->get('text_bold')
		);
		
        //module
		$data['modules'] = array();
		
		if (isset($this->request->post['boss_tagcloud_module'])) {
			$data['modules'] = $this->request->post['boss_tagcloud_module'];
		} elseif (!empty($module_info)) {
			$data['modules'] = $module_info['boss_tagcloud_module'];
		} else {
			$data['modules'] = '';
		}
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/boss_tagcloud.tpl', $data));
		
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/boss_tagcloud')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		$boss_tagcloud_module = isset($this->request->post['boss_tagcloud_module'])?$this->request->post['boss_tagcloud_module']:'';
		
		if ($boss_tagcloud_module) { 			
			if (!$boss_tagcloud_module['limit']) { 
				$this->error['limit'] = $this->language->get('error_limit');
			}
			if (!$boss_tagcloud_module['min_font_size']) { 
				$this->error['min_font_size'] = $this->language->get('error_min_font_size');
			}
			if (!$boss_tagcloud_module['max_font_size']) { 
				$this->error['max_font_size'] = $this->language->get('error_max_font_size');
			}			
		}
		return !$this->error;	
	}
    
    private function getIdLayout($layout_name) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "layout WHERE LOWER(name) = LOWER('".$layout_name."')");
		return (int)$query->row['layout_id'];
	}
	

	public function install() 
	{
		$this->load->language('module/boss_tagcloud');
        
        $this->load->model('setting/setting');
		
		$this->load->model('localisation/language');
			
		$languages = $this->model_localisation_language->getLanguages();
		
		$array_description0 = array();
		$array_description1 = array();
		$array_description2 = array();
		$array_description3 = array();
						
		foreach($languages as $language){
			$array_description0{$language['language_id']} = 'Tag Cloud';
			$array_description1{$language['language_id']} = 'Tag Cloud';
			$array_description2{$language['language_id']} = 'Tag Cloud';
			$array_description3{$language['language_id']} = 'Tag Cloud';
		}
		$boss_tagcloud = array('boss_tagcloud_module' => array ( 		
        0 => array ( 'limit' => 20, 'title' => $array_description1, 'font_weight' => 'normal', 'min_font_size' => 9, 'max_font_size' => 25),
        1 => array ( 'limit' => 20, 'title' => $array_description2, 'font_weight' => 'normal', 'min_font_size' => 9, 'max_font_size' => 25),
        2 => array ( 'limit' => 20, 'title' => $array_description3, 'font_weight' => 'normal', 'min_font_size' => 9, 'max_font_size' => 25)
		),
		'boss_tagcloud_status' => 1,
		);
		
		$this->model_setting_setting->editSetting('boss_tagcloud', $boss_tagcloud);		
	}
    
}
?>