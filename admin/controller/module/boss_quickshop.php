<?php
class ControllerModuleBossQuickshop extends Controller {
	private $error = array(); 

	public function index() {   
		$this->language->load('module/boss_quickshop');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('boss_quickshop', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_text'] = $this->language->get('entry_text');
		$data['entry_array_class_select'] = $this->language->get('entry_array_class_select');
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
		if (isset($this->error['with'])) {
			$data['error_with'] = $this->error['with'];
		} else {
			$data['error_with'] = '';
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
				'href' => $this->url->link('module/boss_quickshop', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);			
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/boss_quickshop', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/boss_quickshop', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}
   		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$data['restore'] = $this->url->link('module/boss_quickshop/restore', 'token=' . $this->session->data['token'], 'SSL');
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
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		$data['modules'] = array();

		if (isset($this->request->post['boss_quickshop_module'])) {
			$data['modules'] = $this->request->post['boss_quickshop_module'];
		} elseif (!empty($module_info)) { 
			$data['modules'] = $module_info['boss_quickshop_module'];
		}else{
			$data['modules'] = array();
		}
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/boss_quickshop.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/boss_quickshop')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		$boss_blogrecentpost = $this->request->post['boss_quickshop_module'];
		
		if (isset($boss_blogrecentpost)) { 			
			if (!$boss_blogrecentpost['width']) { 
				$this->error['width'] = $this->language->get('error_width');
			}			
		}
		
		return !$this->error;	
	}
	
	private function getIdLayout($layout_name) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "layout WHERE LOWER(name) = LOWER('".$layout_name."')");
		return (int)$query->row['layout_id'];
	}
	
	public function restore() { 		
		$this->load->model('extension/module');
		$this->load->model('setting/setting');
		// delete the module
		$this->model_extension_module->deleteModulesByCode('boss_quickshop');		
		$this->model_setting_setting->deleteSetting('boss_quickshop');		
		
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
		$array_description0 = array();
		foreach($languages as $language){
			$array_description0{$language['language_id']} = 'Quick Shop';
		}
		$contents = array(
			0 => array(
				'name' => 'Boss Quickshop - Home',
				'class' => '.box-product&gt;li,.bt-item-extra&gt;section,.bt-product-large&gt;section',
				'layout' => 1, // home page
			),
			1 => array(
				'name' => 'Boss Quickshop - Category',
				'class' => '.product-list&gt;div, .product-grid&gt;div, .box-product&gt;div',
				'layout' => 3,  //category page
			),
		);
		
		foreach($contents as $content){
			//create sample data and add module
			$sample_data = array(
				'name' => $content['name'],
				'code' => 'boss_quickshop',
				'status' => 1,
				'boss_quickshop_module' => array(
					'title' => $array_description0,
					'array_class_selected' => $content['class'],
					'width' => 900,				
				),
			);
			$this->model_extension_module->addModule('boss_quickshop', $sample_data);
			//get module_id
			$module_id = $this->db->getLastId();
			
			//add layout		
			$layout_module = array(
				'code'  => 'boss_quickshop.'.$module_id,
				'position'  => 'content_top',				
				'sort_order'  => 0,
			);			
			$layout_id =$content['layout']; 
			$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
		}
		$_SESSION["restore"] ='You did restore successful.';
		$this->response->redirect($this->url->link('module/boss_quickshop', 'token=' . $this->session->data['token']. '&module_id=' . $module_id, 'SSL'));
	}
}
?>