<?php
class ControllerModuleBossZoom extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/boss_zoom');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('extension/module');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {			
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('boss_zoom', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}		
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_enable'] = $this->language->get('text_enable');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_disable'] = $this->language->get('text_disable');
		$data['text_enabled_disabled'] = $this->language->get('text_enabled_disabled');
		$data['text_information'] = $this->language->get('text_information');
		$data['text_image_Thumb'] = $this->language->get('text_image_Thumb');
		$data['text_image_Addition'] = $this->language->get('text_image_Addition');
		$data['text_image_Zoom'] = $this->language->get('text_image_Zoom');
		$data['text_area_Zoom'] = $this->language->get('text_area_Zoom');
		$data['text_auto_size_area'] = $this->language->get('text_auto_size_area');
		$data['text_area_position'] = $this->language->get('text_area_position');
		$data['text_distance'] = $this->language->get('text_distance');
		$data['text_Inner'] = $this->language->get('text_Inner');
		$data['text_Adjust'] = $this->language->get('text_Adjust');		
		$data['text_title'] = $this->language->get('text_title');
		$data['text_title_opacity'] = $this->language->get('text_title_opacity');
		$data['text_Tint'] = $this->language->get('text_Tint');
		$data['text_Tint_opacity'] = $this->language->get('text_Tint_opacity');
		$data['text_softFocus'] = $this->language->get('text_softFocus');
		$data['text_Opacity_lens'] = $this->language->get('text_Opacity_lens');
		$data['text_Smooth'] = $this->language->get('text_Smooth');
		$data['text_right'] = $this->language->get('text_right');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_name'] = $this->language->get('entry_name');
	
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
		if (isset($this->error['error_thumb_image_width'])) {
			$data['error_thumb_image_width'] = $this->error['error_thumb_image_width'];
		} else {
			$data['error_thumb_image_width'] = '';
		}
		if (isset($this->error['error_thumb_image_height'])) {
			$data['error_thumb_image_height'] = $this->error['error_thumb_image_height'];
		} else {
			$data['error_thumb_image_height'] = '';
		}
		
		if (isset($this->error['error_addition_image_width'])) {
			$data['error_addition_image_width'] = $this->error['error_addition_image_width'];
		} else {
			$data['error_addition_image_width'] = '';
		}
		if (isset($this->error['error_addition_image_height'])) {
			$data['error_addition_image_height'] = $this->error['error_addition_image_height'];
		} else {
			$data['error_addition_image_height'] = '';
		}
		
		if (isset($this->error['error_zoom_image_width'])) {
			$data['error_zoom_image_width'] = $this->error['error_zoom_image_width'];
		} else {
			$data['error_zoom_image_width'] = '';
		}
		if (isset($this->error['error_zoom_image_height'])) {
			$data['error_zoom_image_height'] = $this->error['error_zoom_image_height'];
		} else {
			$data['error_zoom_image_height'] = '';
		}
		
		if (isset($this->error['error_zoom_area_width'])) {
			$data['error_zoom_area_width'] = $this->error['error_zoom_area_width'];
		} else {
			$data['error_zoom_area_width'] = '';
		}
		if (isset($this->error['error_zoom_area_height'])) {
			$data['error_zoom_area_height'] = $this->error['error_zoom_area_height'];
		} else {
			$data['error_zoom_area_height'] = '';
		}
		
		if (isset($this->error['error_adjustX'])) {
			$data['error_adjustX'] = $this->error['error_adjustX'];
		} else {
			$data['error_adjustX'] = '';
		}
		if (isset($this->error['error_adjustY'])) {
			$data['error_adjustY'] = $this->error['error_adjustY'];
		} else {
			$data['error_adjustY'] = '';
		}
		
		if (isset($this->error['error_title_opacity'])) {
			$data['error_title_opacity'] = $this->error['error_title_opacity'];
		} else {
			$data['error_title_opacity'] = '';
		}
		if (isset($this->error['error_tintOpacity'])) {
			$data['error_tintOpacity'] = $this->error['error_tintOpacity'];
		} else {
			$data['error_tintOpacity'] = '';
		}
		
		if (isset($this->error['error_lensOpacity'])) {
			$data['error_lensOpacity'] = $this->error['error_lensOpacity'];
		} else {
			$data['error_lensOpacity'] = '';
		}
		if (isset($this->error['error_smoothMove'])) {
			$data['error_smoothMove'] = $this->error['error_smoothMove'];
		} else {
			$data['error_smoothMove'] = '';
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
				'href' => $this->url->link('module/boss_zoom', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);			
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/boss_zoom', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/boss_zoom', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}
   		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$data['restore'] = $this->url->link('module/boss_zoom/restore', 'token=' . $this->session->data['token'], 'SSL');
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
		if (isset($this->request->post['boss_zoom_module'])) {
			$data['modules'] = $this->request->post['boss_zoom_module'];
		} elseif (!empty($module_info)) {
			$data['modules'] = $module_info['boss_zoom_module'];
		} else {
			$data['modules'] = '';
		}
				
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/boss_zoom.tpl', $data));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/boss_zoom')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		$boss_zoom_module = $this->request->post['boss_zoom_module'];
		
		if (isset($boss_zoom_module)) { 			
			if (!$boss_zoom_module['thumb_image_width']) { 
				$this->error['error_thumb_image_width'] = $this->language->get('error_thumb_image_width');
			}
			if (!$boss_zoom_module['thumb_image_height']) { 
				$this->error['error_thumb_image_height'] = $this->language->get('error_thumb_image_height');
			}
			if (!$boss_zoom_module['addition_image_width']) { 
				$this->error['error_addition_image_width'] = $this->language->get('error_addition_image_width');
			}
			if (!$boss_zoom_module['addition_image_height']) { 
				$this->error['error_addition_image_height'] = $this->language->get('error_addition_image_height');
			}
			if (!$boss_zoom_module['zoom_image_width']) { 
				$this->error['error_zoom_image_width'] = $this->language->get('error_zoom_image_width');
			}
			if (!$boss_zoom_module['zoom_image_height']) { 
				$this->error['error_zoom_image_height'] = $this->language->get('error_zoom_image_height');
			}
			if (!$boss_zoom_module['zoom_area_width']) { 
				$this->error['error_zoom_area_width'] = $this->language->get('error_zoom_area_width');
			}
			if (!$boss_zoom_module['zoom_area_height']) { 
				$this->error['error_zoom_area_height'] = $this->language->get('error_zoom_area_height');
			}
			/*if (!$boss_zoom_module['adjustX']) { 
				$this->error['error_adjustX'] = $this->language->get('error_adjustX');
			}
			if (!$boss_zoom_module['adjustY']) { 
				$this->error['error_adjustY'] = $this->language->get('error_adjustY');
			}
			if (!$boss_zoom_module['title_opacity']) { 
				$this->error['error_title_opacity'] = $this->language->get('error_title_opacity');
			}
			if (!$boss_zoom_module['tintOpacity']) { 
				$this->error['error_tintOpacity'] = $this->language->get('error_tintOpacity');
			}
			if (!$boss_zoom_module['lensOpacity']) { 
				$this->error['error_lensOpacity'] = $this->language->get('error_lensOpacity');
			}
			if (!$boss_zoom_module['smoothMove']) { 
				$this->error['error_smoothMove'] = $this->language->get('error_smoothMove');
			}*/
				
		}
		
		return !$this->error;	
	}
	public function restore() { 		
		$this->load->model('extension/module');
		$this->load->model('setting/setting');
		// delete the module
		$this->model_extension_module->deleteModulesByCode('boss_zoom');		
		$this->model_setting_setting->deleteSetting('boss_zoom');
		
		//create sample data and add module
		$sample_data = array(
			'name' => 'Boss Zoom',
			'code' => 'boss_zoom',
			'status' => 1,
			'boss_zoom_module' => array(
				'thumb_image_width' => 480,
				'thumb_image_height' => 480,
				'addition_image_width' => 90,
				'addition_image_height' => 90,
				'zoom_image_width' => 700,
				'zoom_image_height' => 700,
				'zoom_area_width' => 480,
				'zoom_area_height' => 480,
				'position_zoom_area' => 'inside',
				'adjustX' => 0,
				'adjustY' => 0,
				'title_image' => 1,
				'title_opacity' => 0.5,
				'tint' => '#FFFFFF',
				'tintOpacity' => 0.5,
				'softfocus' => 1,
				'lensOpacity' => 0.7,
				'smoothMove' => 3,
			),
		);
		$this->model_extension_module->addModule('boss_zoom', $sample_data);
		//get module_id
		$module_id = $this->db->getLastId();
		
		//add layout		
		$layout_module = array(
			'code'  => 'boss_zoom.'.$module_id,
			'position'  => 'content_top',				
			'sort_order'  => 0,
		);			
		$layout_id =2;  // product page
		$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
		$_SESSION["restore"] ='You did restore successful.';
		$this->response->redirect($this->url->link('module/boss_zoom', 'token=' . $this->session->data['token']. '&module_id=' . $module_id, 'SSL'));
	}

}
?>