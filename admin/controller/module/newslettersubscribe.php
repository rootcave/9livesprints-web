<?php
class ControllerModuleNewslettersubscribe extends Controller {
	private $error = array(); 
	
	public function index() {   
	
		$this->load->language('module/newslettersubscribe');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('extension/module');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
				
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('newslettersubscribe', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}		 
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_edit'] = $this->language->get('text_edit');
		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_unsubscribe'] = $this->language->get('entry_unsubscribe');
		$data['entry_thickbox'] = $this->language->get('entry_thickbox');
		$data['entry_registered'] = $this->language->get('entry_registered');	
		$data['entry_mail'] = $this->language->get('entry_mail');
		$data['entry_options'] = $this->language->get('entry_options');
		
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
				'href' => $this->url->link('module/newslettersubscribe', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);			
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/newslettersubscribe', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/newslettersubscribe', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}
   		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
			$data['module_id'] = $this->request->get['module_id'];
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
		if (isset($this->request->post['option_unsubscribe'])) {
			$data['option_unsubscribe'] = $this->request->post['option_unsubscribe'];
		} elseif (!empty($module_info)) {
			$data['option_unsubscribe'] = $module_info['option_unsubscribe'];
		} else {
			$data['option_unsubscribe'] = '';
		}
		
		if (isset($this->request->post['newslettersubscribe_registered'])) {
			$data['newslettersubscribe_registered'] = $this->request->post['newslettersubscribe_registered'];
		} elseif (!empty($module_info)) {
			$data['newslettersubscribe_registered'] = $module_info['newslettersubscribe_registered'];
		} else {
			$data['newslettersubscribe_registered'] = '';
		}
		
		if (isset($this->request->post['newslettersubscribe_mail_status'])) {
			$data['newslettersubscribe_mail_status'] = $this->request->post['newslettersubscribe_mail_status'];
		} elseif (!empty($module_info)) {
			$data['newslettersubscribe_mail_status'] = $module_info['newslettersubscribe_mail_status'];
		} else {
			$data['newslettersubscribe_mail_status'] = '';
		}
		
		if (isset($this->request->post['newslettersubscribe_option_field'])) {
			$data['newslettersubscribe_option_field'] = $this->request->post['newslettersubscribe_option_field'];
		} elseif (!empty($module_info)) {
			$data['newslettersubscribe_option_field'] = isset($module_info['newslettersubscribe_option_field'])?$module_info['newslettersubscribe_option_field']:'';
		} else {
			$data['newslettersubscribe_option_field'] = '';
		}
		
		if (isset($this->request->post['newslettersubscribe_option_field1'])) {
			$data['newslettersubscribe_option_field1'] = $this->request->post['newslettersubscribe_option_field1'];
		} elseif (!empty($module_info)) {
			$data['newslettersubscribe_option_field1'] = isset($module_info['newslettersubscribe_option_field1'])?$module_info['newslettersubscribe_option_field1']:'';
		} else {
			$data['newslettersubscribe_option_field1'] = '';
		}
		if (isset($this->request->post['newslettersubscribe_option_field2'])) {
			$data['newslettersubscribe_option_field2'] = $this->request->post['newslettersubscribe_option_field2'];
		} elseif (!empty($module_info)) {
			$data['newslettersubscribe_option_field2'] = isset($module_info['newslettersubscribe_option_field2'])?$module_info['newslettersubscribe_option_field2']:'';
		} else {
			$data['newslettersubscribe_option_field2'] = '';
		}
		if (isset($this->request->post['newslettersubscribe_option_field3'])) {
			$data['newslettersubscribe_option_field3'] = $this->request->post['newslettersubscribe_option_field3'];
		} elseif (!empty($module_info)) {
			$data['newslettersubscribe_option_field3'] = isset($module_info['newslettersubscribe_option_field3'])?$module_info['newslettersubscribe_option_field3']:'';
		} else {
			$data['newslettersubscribe_option_field3'] = '';
		}
		if (isset($this->request->post['newslettersubscribe_option_field4'])) {
			$data['newslettersubscribe_option_field4'] = $this->request->post['newslettersubscribe_option_field4'];
		} elseif (!empty($module_info)) {
			$data['newslettersubscribe_option_field4'] = isset($module_info['newslettersubscribe_option_field4'])?$module_info['newslettersubscribe_option_field4']:'';
		} else {
			$data['newslettersubscribe_option_field4'] = '';
		}
		if (isset($this->request->post['newslettersubscribe_option_field5'])) {
			$data['newslettersubscribe_option_field5'] = $this->request->post['newslettersubscribe_option_field5'];
		} elseif (!empty($module_info)) {
			$data['newslettersubscribe_option_field5'] = isset($module_info['newslettersubscribe_option_field5'])?$module_info['newslettersubscribe_option_field5']:'';
		} else {
			$data['newslettersubscribe_option_field5'] = '';
		}
		if (isset($this->request->post['newslettersubscribe_option_field6'])) {
			$data['newslettersubscribe_option_field6'] = $this->request->post['newslettersubscribe_option_field6'];
		} elseif (!empty($module_info)) {
			$data['newslettersubscribe_option_field6'] = isset($module_info['newslettersubscribe_option_field6'])?$module_info['newslettersubscribe_option_field6']:'';
		} else {
			$data['newslettersubscribe_option_field6'] = '';
		}
		if (isset($this->request->post['newslettersubscribe_module'])) {
			$data['modules'] = $this->request->post['newslettersubscribe_module'];
		} elseif (!empty($module_info)) {
			$data['modules'] = $module_info['newslettersubscribe_module'];
		} else {
			$data['modules'] = '';
		}
		
				
		//load languages
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/newslettersubscribe.tpl', $data));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/newslettersubscribe')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		return !$this->error;	
	}
}
?>