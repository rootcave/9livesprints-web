<?php
class ControllerModuleBossCarousel extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/boss_carousel');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('extension/module');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
				
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('boss_carousel', $this->request->post);
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
		$data['entry_banner'] = $this->language->get('entry_banner');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_scroll'] = $this->language->get('entry_scroll');
		$data['entry_image_width'] = $this->language->get('entry_image_width');
		$data['entry_image_height'] = $this->language->get('entry_image_height');
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
		if (isset($this->error['limit'])) {
			$data['error_limit'] = $this->error['limit'];
		} else {
			$data['error_limit'] = '';
		}
		
		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}
		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
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
				'href' => $this->url->link('module/boss_carousel', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);			
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/boss_carousel', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/boss_carousel', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
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
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		$data['modules'] = array();
		
		if (isset($this->request->post['boss_carousel_module'])) {
			$data['modules'] = $this->request->post['boss_carousel_module'];
		} elseif (!empty($module_info)) { 
			$data['modules'] = $module_info['boss_carousel_module'];
		}else{
			$data['modules'] = array();
		}
		
		$this->load->model('design/banner');
		
		$data['banners'] = $this->model_design_banner->getBanners();
						
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/boss_carousel.tpl', $data));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/boss_carousel')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		$boss_carousel_module = $this->request->post['boss_carousel_module'];
		
		if (isset($boss_carousel_module)) { 			
			if (!$boss_carousel_module['limit']) { 
				$this->error['limit'] = $this->language->get('error_limit');
			}				
			if (!$boss_carousel_module['width']) { 
				$this->error['width'] = $this->language->get('error_width');
			}
			if (!$boss_carousel_module['height']) { 
				$this->error['height'] = $this->language->get('error_height');
			}
		}
		
		return !$this->error;	
	}
	
	
}
?>