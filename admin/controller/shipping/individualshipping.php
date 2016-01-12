<?php
class ControllerShippingindividualshipping extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('shipping/individualshipping');

		$this->document->setTitle( $this->language->get('heading_title') );
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
//                        print_r($this->request->post);
			$this->model_setting_setting->editSetting('individualshipping', $this->request->post);

                        $this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect(HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . $this->session->data['token']);
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_all_zones'] = $this->language->get('text_all_zones');
		$this->data['text_none'] = $this->language->get('text_none');
		
		$this->data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
		$this->data['entry_cost'] = $this->language->get('entry_cost');
		$this->data['entry_tax'] = $this->language->get('entry_tax');
		$this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_general'] = $this->language->get('tab_general');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->document->breadcrumbs = array();

   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=common/home&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('text_shipping'),
      		'separator' => ' :: '
   		);
		
   		$this->document->breadcrumbs[] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=shipping/individualshipping&token=' . $this->session->data['token'],
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = HTTPS_SERVER . 'index.php?route=shipping/individualshipping&token=' . $this->session->data['token'];
		
		$this->data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . $this->session->data['token'];

		if (isset($this->request->post['individualshipping_default'])) {
			$this->data['individualshipping_default'] = $this->request->post['individualshipping_default'];
		} else {
			$this->data['individualshipping_default'] = $this->config->get('individualshipping_default');
		}
	
		if (isset($this->request->post['individualshipping_cost'])) {
			$this->data['individualshipping_cost'] = $this->request->post['individualshipping_cost'];
		} else {
			$this->data['individualshipping_cost'] = $this->config->get('individualshipping_cost');
		}

		if (isset($this->request->post['individualshipping_tax_class_id'])) {
			$this->data['individualshipping_tax_class_id'] = $this->request->post['individualshipping_tax_class_id'];
		} else {
			$this->data['individualshipping_tax_class_id'] = $this->config->get('individualshipping_tax_class_id');
		}

		if (isset($this->request->post['individualshipping_geo_zone_id'])) {
			$this->data['individualshipping_geo_zone_id'] = $this->request->post['individualshipping_geo_zone_id'];
		} else {
			$this->data['individualshipping_geo_zone_id'] = $this->config->get('individualshipping_geo_zone_id');
		}
		
		if (isset($this->request->post['individualshipping_status'])) {
			$this->data['individualshipping_status'] = $this->request->post['individualshipping_status'];
		} else {
			$this->data['individualshipping_status'] = $this->config->get('individualshipping_status');
		}
		
		if (isset($this->request->post['individualshipping_sort_order'])) {
			$this->data['individualshipping_sort_order'] = $this->request->post['individualshipping_sort_order'];
		} else {
			$this->data['individualshipping_sort_order'] = $this->config->get('individualshipping_sort_order');
		}			

		$this->load->model('localisation/tax_class');
		
		$this->data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
		
		$this->load->model('localisation/geo_zone');
		
		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();


                $this->template = 'shipping/individualshipping.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'shipping/individualshipping')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>
