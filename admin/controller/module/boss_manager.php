<?php
class ControllerModuleBossManager extends Controller {
	private $error = array(); 

	public function index() {   
		$this->language->load('module/boss_manager');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		$this->load->model('tool/image');
		
		$this->document->addStyle('view/stylesheet/bossthemes/boss_manager.css');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$this->model_setting_setting->editSetting('boss_manager', $this->request->post);		
			$this->saveXML($this->request->post['xml'],isset($this->request->post['custom_color'])?$this->request->post['custom_color']:'');
			$this->saveXMLFont($this->request->post['xml_font'],isset($this->request->post['custom_font'])?$this->request->post['custom_font']:'');
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('module/boss_manager', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_content_top'] = $this->language->get('text_content_top');
		$data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$data['text_column_left'] = $this->language->get('text_column_left');
		$data['text_column_right'] = $this->language->get('text_column_right');

		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_position'] = $this->language->get('entry_position');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_module'] = $this->language->get('button_add_module');
		$data['button_remove'] = $this->language->get('button_remove');
		
		$data['arrstatus'] = array(
			"0" => $this->language->get('text_disabled'),
			"1" => $this->language->get('text_enabled')
		);
		
		$data['arrshow'] = array(
			"use_tab" => $this->language->get('text_tab'),
			"use_accordion" => $this->language->get('text_accordion')
		);
		$data['arrview'] = array(
			"grid" => $this->language->get('text_grid'),
			"list" => $this->language->get('text_list'),
			"both_list" => $this->language->get('text_both_list'),
			"both_grid" => $this->language->get('text_both_grid')
		);
		$data['arrusemenu'] = array(
			"default" => $this->language->get('text_default'),
			"megamenu" => $this->language->get('text_megamenu'),			
		);
		$data['arrperrow'] = array(
			"1" => 1,
			"2" => 2,			
			"3" => 3,			
			"4" => 4,			
			"5" => 5,			
			"6" => 6,			
		);
		$data['arrstyle'] = array(
			"1" => 'Homepage default',
			"2" => 'Homepage 2',			
			"3" => 'Homepage 3',			
			"4" => 'Homepage 4',			
			"5" => 'Homepage 5',			
			"6" => 'Homepage 6',			
		);
		$data['token'] = $this->session->data['token'];
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
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

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/boss_manager', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['action'] = $this->url->link('module/boss_manager', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$data['boss_manager'] = array();
		
		$data['option'] = array();
		$data['layout'] = array();
		
		$data['footer_about'] = array();
		
		
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		
		if (isset($this->request->post['boss_manager_footer_about'])) {
			$data['footer_about'] = $this->request->post['boss_manager_footer_about'];
		} elseif ($this->config->get('boss_manager_footer_about')) { 
			$data['footer_about'] = $this->config->get('boss_manager_footer_about');
		}
		
		$footer_about = $data['footer_about'];
		
		if (isset($footer_about['image_link']) && file_exists(DIR_IMAGE . $footer_about['image_link'])) {
			$data['about_image'] = $this->model_tool_image->resize($footer_about['image_link'], 100, 100);
		} else {
			$data['about_image'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		$data['footer_shipping'] = array();
		
		if (isset($this->request->post['boss_manager_footer_shipping'])) {
			$data['footer_shipping'] = $this->request->post['boss_manager_footer_shipping'];
		} elseif ($this->config->get('boss_manager_footer_shipping')) { 
			$data['footer_shipping'] = $this->config->get('boss_manager_footer_shipping');
		}
		
		
		$data['footer_contact'] = array();
		
		if (isset($this->request->post['boss_manager_footer_contact'])) {
			$data['footer_contact'] = $this->request->post['boss_manager_footer_contact'];
		} elseif ($this->config->get('boss_manager_footer_contact')) { 
			$data['footer_contact'] = $this->config->get('boss_manager_footer_contact');
		}
		
		$data['footer_social'] = array();
		
		if (isset($this->request->post['boss_manager_footer_social'])) {
			$data['footer_social'] = $this->request->post['boss_manager_footer_social'];
		} elseif ($this->config->get('boss_manager_footer_social')) { 
			$data['footer_social'] = $this->config->get('boss_manager_footer_social');
		}
		
		$data['footer_payment'] = array();
		
		if (isset($this->request->post['boss_manager_footer_payment'])) {
			$data['footer_payment'] = $this->request->post['boss_manager_footer_payment'];
		} elseif ($this->config->get('boss_manager_footer_social')) { 
			$data['footer_payment'] = $this->config->get('boss_manager_footer_payment');
		}
		
		$data['footer_powered'] = array();
		
		if (isset($this->request->post['boss_manager_footer_powered'])) {
			$data['footer_powered'] = $this->request->post['boss_manager_footer_powered'];
		} elseif ($this->config->get('boss_manager_footer_powered')) { 
			$data['footer_powered'] = $this->config->get('boss_manager_footer_powered');
		}
		
		$boss_manager = array();

		if (isset($this->request->post['boss_manager'])) {
			$boss_manager = $this->request->post['boss_manager'];
		} elseif ($this->config->get('boss_manager')) { 
			$boss_manager = $this->config->get('boss_manager');
		}

		$data['boss_manager'] = $boss_manager;
		
		if(!empty($boss_manager)){
			$data['option'] = $boss_manager['option'];
			$data['status'] = $boss_manager['status'];
			$data['layout'] = $boss_manager['layout'];
			$data['other'] = $boss_manager['other'];
			$data['color'] = $boss_manager['color'];
		}
		
		$this->load->model('localisation/language');
		
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/boss_manager.tpl', $data));

	}
	protected function saveXML($groups,$customs) {
		//echo "<pre>"; print_r($customs); echo "</pre>";die();
		$xml = new DOMDocument('1.0','UTF-8');

		//create item_setting
		$root = $xml->createElement('items_setting');
		$xml->appendChild($root);	
		
		foreach($groups as $group){
			//create groups
			$groups_xml = $xml->createElement('groups');
			$root->appendChild($groups_xml);
			
			//create title		
			$title = $xml->createElement('title');
			$groups_xml->appendChild($title);
			//add value
			$title->appendChild($xml->createTextNode($group['title'][0]));
			if(isset($group['text'])){
				for($i=0; $i< count($group['text']) ; $i++){ 
					//create item
					$item = $xml->createElement('item');
					$groups_xml->appendChild($item);		
					
					//create text		
					$text = $xml->createElement('text');
					$item->appendChild($text);
					//add value
					$text->appendChild($xml->createTextNode($group['text'][$i]));
					
					//create name		
					$name = $xml->createElement('name');
					$item->appendChild($name);
					//add value
					$name->appendChild($xml->createTextNode($group['name'][$i]));
					
					//create class		
					$class = $xml->createElement('class');
					$item->appendChild($class);
					//add value
					$class->appendChild($xml->createTextNode($group['class'][$i]));
					
					//create value		
					$value = $xml->createElement('value');
					$item->appendChild($value);
					//add value
					$value->appendChild($xml->createTextNode($group['value'][$i]));
					
					//create style		
					$style = $xml->createElement('style');
					$item->appendChild($style);
					//add value
					$style->appendChild($xml->createTextNode($group['style'][$i]));
				}
			}
		}
		
		//create customs
		$customs_xml = $xml->createElement('customs');
		$root->appendChild($customs_xml);
		if(!empty($customs)){
			foreach($customs as $custom){ 		
				//create item
				$item = $xml->createElement('item');
				$customs_xml->appendChild($item);		
				
				//create text		
				$text = $xml->createElement('text');
				$item->appendChild($text);
				//add value
				$text->appendChild($xml->createTextNode($custom['text']));
				
				//create class		
				$class = $xml->createElement('class');
				$item->appendChild($class);
				//add value
				$class->appendChild($xml->createTextNode($custom['class']));
				
				//create value		
				$value = $xml->createElement('value');
				$item->appendChild($value);
				//add value
				$value->appendChild($xml->createTextNode($custom['value']));
				
				//create important		
				$important = $xml->createElement('important');
				$item->appendChild($important);
				//add value
				$important->appendChild($xml->createTextNode($custom['important']));
				
				//create style		
				$style = $xml->createElement('style');
				$item->appendChild($style);
				//add value
				$style->appendChild($xml->createTextNode($custom['style']));
			}
		}
		//nice output
		$xml->formatOutput = true;
		$xml->save("../config_xml/color_setting.xml"); 
	}
	protected function saveXMLFont($groups,$customs) {
		//echo "<pre>"; print_r($customs); echo "</pre>";die();
		$xml = new DOMDocument('1.0','UTF-8');

		//create item_setting
		$root = $xml->createElement('items_setting');
		$xml->appendChild($root);	
		
		foreach($groups as $group){
			//create groups
			$groups_xml = $xml->createElement('groups');
			$root->appendChild($groups_xml);
			
			//create title		
			$title = $xml->createElement('title');
			$groups_xml->appendChild($title);
			//add value
			$title->appendChild($xml->createTextNode($group['title'][0]));
			if(isset($group['text'])){
				for($i=0; $i< count($group['text']) ; $i++){ 
					//create item
					$item = $xml->createElement('item');
					$groups_xml->appendChild($item);		
					
					//create text		
					$text = $xml->createElement('text');
					$item->appendChild($text);
					//add value
					$text->appendChild($xml->createTextNode($group['text'][$i]));
					
					//create style		
					$style = $xml->createElement('style');
					$item->appendChild($style);
					//add value
					$style->appendChild($xml->createTextNode($group['style'][$i]));
					
					//create size		
					$size = $xml->createElement('size');
					$item->appendChild($size);
					//add value
					$size->appendChild($xml->createTextNode($group['size'][$i]));
					
					//create weight		
					$weight = $xml->createElement('weight');
					$item->appendChild($weight);
					//add value
					$weight->appendChild($xml->createTextNode($group['weight'][$i]));
					
					//create transform		
					$transform = $xml->createElement('transform');
					$item->appendChild($transform);
					//add value
					$transform->appendChild($xml->createTextNode($group['transform'][$i]));
					
					//create class_name		
					$class_name = $xml->createElement('class_name');
					$item->appendChild($class_name);
					//add value
					$class_name->appendChild($xml->createTextNode($group['class_name'][$i]));
				}
			}
		}
		
		//create customs
		$customs_xml = $xml->createElement('customs');
		$root->appendChild($customs_xml);
		if(!empty($customs)){
			foreach($customs as $custom){ 		
				//create item
				$item = $xml->createElement('item');
				$customs_xml->appendChild($item);		
				
				//create text		
				$text = $xml->createElement('text');
				$item->appendChild($text);
				//add value
				$text->appendChild($xml->createTextNode($custom['text']));
				
				//create style		
				$style = $xml->createElement('style');
				$item->appendChild($style);
				//add value
				$style->appendChild($xml->createTextNode($custom['style']));
				
				//create size		
				$size = $xml->createElement('size');
				$item->appendChild($size);
				//add value
				$size->appendChild($xml->createTextNode($custom['size']));
				
				//create weight		
				$weight = $xml->createElement('weight');
				$item->appendChild($weight);
				//add value
				$weight->appendChild($xml->createTextNode($custom['weight']));
				
				//create transform		
				$transform = $xml->createElement('transform');
				$item->appendChild($transform);
				//add value
				$transform->appendChild($xml->createTextNode($custom['transform']));
				
				//create class_name		
				$class_name = $xml->createElement('class_name');
				$item->appendChild($class_name);
				//add value
				$class_name->appendChild($xml->createTextNode($custom['class_name']));
			}
		}
		//nice output
		$xml->formatOutput = true;
		$xml->save("../config_xml/font_setting.xml"); 
	}
	public function changeTemplate(){
		
		$this->document->addStyle('view/stylesheet/bossthemes/boss_manager.css');
		if (isset($this->request->get['value']) && !empty($this->request->get['value'])) {
			$value = $this->request->get['value'];			
		} else {
			$value = 1;
		}
		
		if($value==1){
			$data['objXML'] = simplexml_load_file("../config_xml/theme_color_1.xml");
		}
	
		$json = array();			
	
		$json['output'] = $this->load->view('module/boss_changetemplate.tpl', $data);
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/boss_manager')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	public function install() 
	{
		$this->load->model('setting/setting');
		$this->load->model('localisation/language');			
		$languages = $this->model_localisation_language->getLanguages();
		
		$free_shipping_title = array();
		$free_shipping_content = array();
		$about_us_title = array();
		$about_us_content = array();
		$contact_us_title = array();
		$contact_us_content = array();
		$follow_us_title = array();
		$powered_content = array();
		
		foreach($languages as $language){
			$free_shipping_title{$language['language_id']} = '';
			$free_shipping_content{$language['language_id']} = '&lt;div class=&quot;container&quot;&gt;
&lt;div class=&quot;footer-block-shipping not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;300&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;block block-1 col-lg-4 col-md-4 col-sm-12 col-xs-12&quot;&gt;
&lt;div class=&quot;icon&quot;&gt;&lt;i class=&quot;fa fa-truck&quot;&gt;&lt;b&gt;test&lt;/b&gt;&lt;/i&gt;&lt;/div&gt;
&lt;div class=&quot;text&quot;&gt;
&lt;h3&gt;free shipping&lt;/h3&gt;
&lt;span&gt;Free shipping on order over $1000&lt;/span&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;block block-2 col-lg-4 col-md-4 col-sm-12 col-xs-12&quot;&gt;
&lt;div class=&quot;icon&quot;&gt;&lt;i class=&quot;fa fa-repeat&quot;&gt;&lt;b&gt;test&lt;/b&gt;&lt;/i&gt;&lt;/div&gt;
&lt;div class=&quot;text&quot;&gt;
&lt;h3&gt;free return&lt;/h3&gt;
&lt;span&gt;free return in 24 hour after purchasing&lt;/span&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;block block-3 col-lg-4 col-md-4 col-sm-12 col-xs-12&quot;&gt;
&lt;div class=&quot;icon&quot;&gt;&lt;i class=&quot;fa fa-phone&quot;&gt;&lt;b&gt;test&lt;/b&gt;&lt;/i&gt;&lt;/div&gt;
&lt;div class=&quot;text&quot;&gt;
&lt;h3&gt;call toll free&lt;/h3&gt;
&lt;span&gt;call (01) 123 456 PB for free ordering&lt;/span&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;';					
			$about_us_title{$language['language_id']} = 'About Us';					
			$about_us_content{$language['language_id']} = '&lt;div class=&quot;about-store not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;300&quot;&gt;
&lt;p&gt;Fusce ligula sapien, rutrum vel euismod id, viverra ut massa. Suspendisse potenti. Quisque a magna est, id interdum nunc. Suspendisse lobortis augue viverra dui posuere dictum.&lt;/p&gt;
&lt;p&gt;Suspendisse lobortis augue viverra dui posuere dictum. Cras facilisis ultries orci at pharetra In hac habitasse platea dictumst.&lt;/p&gt;
&lt;/div&gt;';		
			$contact_us_title{$language['language_id']} = 'Contact us';					
			$contact_us_content{$language['language_id']} = '&lt;div class=&quot;contact-us not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;300&quot;&gt;
&lt;div class=&quot;address&quot;&gt;
&lt;div class=&quot;image&quot;&gt;&lt;span&gt;test&lt;/span&gt;&lt;/div&gt;
&lt;p&gt;&lt;span&gt;123 Fake Street Name, Fake City, Fake Country.&lt;/span&gt;&lt;/p&gt;
&lt;/div&gt;
&lt;div class=&quot;email&quot;&gt;
&lt;div class=&quot;image&quot;&gt;&lt;span&gt;test&lt;/span&gt;&lt;/div&gt;
&lt;p&gt;&lt;span&gt;support@handcraft.com&lt;/span&gt;&lt;/p&gt;
&lt;/div&gt;
&lt;div class=&quot;font&quot;&gt;
&lt;div class=&quot;image&quot;&gt;&lt;span&gt;test&lt;/span&gt;&lt;/div&gt;
&lt;p&gt;&lt;span&gt;(01) 123 456 HC&lt;/span&gt;&lt;/p&gt;
&lt;/div&gt;
&lt;/div&gt;';
			$follow_us_title{$language['language_id']} = 'Follow us';	
			$powered_content{$language['language_id']} = '&lt;div id=&quot;powered&quot;&gt;
&lt;p&gt;Copyright &copy; 2014 Paralbag Bag Store. All rights Reserved.&lt;span&gt;Opencart Themes by &lt;a href=&quot;http://www.bossthemes.com&quot;&gt;Bossthemes.com.&lt;/a&gt;&lt;/span&gt;&lt;/p&gt;
&lt;/div&gt;';
		}
		$boss_manager = array(
			'boss_manager' => array ( 
				'status' => 1,
				'option' => array(
					'bt_scroll_top' => 1,
					'sticky_menu' => 1,
					'use_menu' => 'megamenu',
					'animation' => 1,	
					'loading' => 1,	
				),
				'layout' => array(
					'mode_css' => 'wide',
					'box_width' => 1200,
					'h_mode_css' => 'inherit',
					'h_box_width' => 1200,
					'f_mode_css' => 'inherit',
					'f_box_width' => 1200,
				),
				'header_link' => array(
					'language' => 1,
					'currency' => 1,
					'phone' => 0,
					'my_account' => 1,
					'wishlist' => 1,
					'shopping_cart' => 1,
					'checkout' => 1,
					'logo' => 1,
					'search' => 1,
					'cart_mini' => 1,
				),
				'footer_link' => array(
					'information' => 1,
					'contact_us' => 1,
					'return' => 1,
					'site_map' => 1,
					'brands' => 1,
					'gift_vouchers' => 1,
					'affiliates' => 1,
					'specials' => 1,
					'my_account' => 1,
					'order_history' => 1,
					'wishlist' => 0,
					'newsletter' => 1,					
				),
				'color' => 1,
				'other' => array(
					'pro_tab' => 'use_tab',
					'category_info' => 1,
					'refine_search' => 1,
					'view_pro' => 'both_grid',
					'perrow' => 3,
					'stylesheet' => 1,
					'class_home' => '',
				),
			),
			'boss_manager_footer_shipping' => array(
				'status' => 1,
				'contact_title' => $free_shipping_title,
				'contact_content' => $free_shipping_content,
			),
			'boss_manager_footer_about' => array(
				'status' => 1,
				'image_status' => 1,
				'image_link' => 'catalog/bt_parallax/logo-footer.png',
				'image_url' => '#',
				'about_title' => $about_us_title,
				'about_content' => $about_us_content,
			),
			'boss_manager_footer_contact' => array(
				'status' => 1,
				'contact_title' => $contact_us_title,
				'contact_content' => $contact_us_content,
			),
			'boss_manager_footer_social' => array(
				'status' => 1,
				'title' => $follow_us_title,
				'face_url' => '#',
				'pinterest_url' => '#',
				'twitter_url' => '#',				
				'googleplus_url' => '#',				
				'rss_url' => '#',		
				'youtube_url' => '#',				
			),
			'boss_manager_footer_payment' => array(
				'status' => 1,
				'visa_status' => 1,
				'visa_link' => '#',
				'master_status' => 1,
				'master_link' => '#',				
				'merican_status' => 1,				
				'merican_link' => '#',		
				'paypal_status' => 1,				
				'paypal_link' => '#',
				'skrill_status' => 1,				
				'skrill_link' => '#',				
			),
			'boss_manager_footer_powered' => $powered_content,
		);
		
		$this->model_setting_setting->editSetting('boss_manager', $boss_manager);		
	}
	private function deleteDataModule($code) {
		$this->load->model('extension/module');
		$this->load->model('setting/setting');
		// delete the module
		$this->model_extension_module->deleteModulesByCode($code);		
		$this->model_setting_setting->deleteSetting($code);
   	}
	private function uninstallModule($code) {			
    	$this->db->query("DELETE FROM " . DB_PREFIX . "extension WHERE code = '" . $this->db->escape($code) . "'");    	
   	}
	private function installModule($code) {	
		$this->load->model('user/user_group');		
		$this->uninstallModule($code);		
		$this->db->query("INSERT INTO " . DB_PREFIX . "extension SET type	= 'module', code = '" . $this->db->escape($code) . "'");	
		$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'module/'.$code);
		
   	}
	private function getIdLayout($layout_name) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "layout WHERE LOWER(name) = LOWER('".$layout_name."')");
		return (int)$query->row['layout_id'];
	}
	public function addSampleData(){
		$module_code = $this->request->get['module_code'];
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
		$json = array();
		$json['error'] = '';
		switch ($module_code) {
			case 'boss_alphabet':
				$code = 'boss_alphabet';
				$this->deleteDataModule($code);
				$this->installModule($code);
				$title = array();
				foreach($languages as $language){
					$title{$language['language_id']} = 'Quick Select';
				}
				//create sample data and add module
				$sample_data = array(
					'name' => 'Alphabet',
					'code' => $code,
					'status' => 1,
					'boss_alphabet_module' => array(
						'title' => $title,										
					),
				);
				$this->model_extension_module->addModule($code, $sample_data);
				//get module_id
				$module_id = $this->db->getLastId();
				
				$layouts = array(
					0 =>  array(
						'layout_id' => $this->getIdLayout('category'), // categpry page		
						'position' => 'column_left',
						'sort_order' => 2,
					),
					1 =>  array(
						'layout_id' => $this->getIdLayout('product'), // product page		
						'position' => 'column_left',
						'sort_order' => 2,
					),
					2 =>  array(
						'layout_id' => $this->getIdLayout('manufacturer'), // manufacture page		
						'position' => 'column_left',
						'sort_order' => 2,
					),					
				);
				foreach($layouts as $layout){
					//add layout		
					$layout_module = array(
						'code'  => $code.'.'.$module_id,
						'position'  => $layout['position'],				
						'sort_order'  => $layout['sort_order'],
					);			
					$layout_id = $layout['layout_id']; 
					$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
				}
			break;
			case 'boss_category':
				$code = 'boss_category';
				$this->deleteDataModule($code);
				$this->installModule($code);
				$title = array();
				foreach($languages as $language){
					$title{$language['language_id']} = 'Shop by';
				}
				//create sample data and add module
				$sample_data = array(
					'name' => 'Boss - Category',
					'code' => $code,
					'status' => 1,
					'title' => $title,
					'type' => 1,
					'column' => 2,
					'width' => 380,					
				);
				$this->model_extension_module->addModule($code, $sample_data);
				//get module_id
				$module_id = $this->db->getLastId();
				
				$layouts = array(
					0 =>  array(
						'layout_id' => $this->getIdLayout('category'), // categpry page		
						'position' => 'column_left',
						'sort_order' => 1,
					),
					1 =>  array(
						'layout_id' => $this->getIdLayout('product'), // product page		
						'position' => 'column_left',
						'sort_order' => 1,
					),
					2 =>  array(
						'layout_id' => $this->getIdLayout('manufacturer'), // manufacture page		
						'position' => 'column_left',
						'sort_order' => 1,
					),					
				);
				foreach($layouts as $layout){
					//add layout		
					$layout_module = array(
						'code'  => $code.'.'.$module_id,
						'position'  => $layout['position'],				
						'sort_order'  => $layout['sort_order'],
					);			
					$layout_id = $layout['layout_id']; 
					$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
				}
			break;
			case 'boss_featured':
				$code = 'boss_featured';
				$this->deleteDataModule($code);
				$this->installModule($code);
				$title = array();
				foreach($languages as $language){
					$title{$language['language_id']} = 'Totes & Hobos';
				}
				//create sample data and add module
				$sample_data = array(
					'name' => 'Featured Product',
					'code' => $code,
					'status' => 1,
					'title' => $title,
					'type_product' => 'latest',
					'image_width' => 380,					
					'image_height' => 380,					
					'limit' => 8,					
					'show_slider' => 0,					
					'num_row' => 1,					
					'per_row' => 4,					
					'nav_type' => 0,					
					'show_pro_large' => 0,					
					'product_id' => '',					
					'img_width' => 380,					
					'img_height' => 380,					
				);
				$this->model_extension_module->addModule($code, $sample_data);
				//get module_id
				$module_id = $this->db->getLastId();
				
				$layouts = array(
					0 =>  array(
						'layout_id' => $this->getIdLayout('home'), // home page		
						'position' => 'content_top',
						'sort_order' => 4,
					),									
				);
				foreach($layouts as $layout){
					//add layout		
					$layout_module = array(
						'code'  => $code.'.'.$module_id,
						'position'  => $layout['position'],				
						'sort_order'  => $layout['sort_order'],
					);			
					$layout_id = $layout['layout_id']; 
					$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
				}
			break;
			case 'boss_filterproduct':
				$code = 'boss_filterproduct';
				$this->deleteDataModule($code);
				$this->installModule($code);
				$title1 = array();
				$title2 = array();
				$title3 = array();
				foreach($languages as $language){
					$title1{$language['language_id']} = 'FEATURED';					
					$title2{$language['language_id']} = 'BEST SELLERS';					
					$title3{$language['language_id']} = 'POPULAR';	
				}
				//create sample data and add module
				$sample_data = array(
					'name' => 'Filter Product - Home',
					'code' => $code,
					'status' => 1,
					'boss_filterproduct_module' => array(
						'image_width' => 255,
						'image_height' => 255,
						'limit' => 16,
						'use_scrolling_panel' => 1,
						'scroll' => 4,
						'use_tab' => 1,
						'tabs' => array(
							0 => array(
								'title' => $title1,
								'type_product' => 'latest',
							),
							1 => array(
								'title' => $title2,
								'type_product' => 'latest',
							),
							2 => array(
								'title' => $title3,
								'type_product' => 'latest',
							),
						),
						
					),
				);
				$this->model_extension_module->addModule($code, $sample_data);
				//get module_id
				$module_id = $this->db->getLastId();
				
				$layouts = array(
					0 =>  array(
						'layout_id' => $this->getIdLayout('home'), // home page		
						'position' => 'content_top',
						'sort_order' => 4,
					),									
				);
				foreach($layouts as $layout){
					//add layout		
					$layout_module = array(
						'code'  => $code.'.'.$module_id,
						'position'  => $layout['position'],				
						'sort_order'  => $layout['sort_order'],
					);			
					$layout_id = $layout['layout_id']; 
					$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
				}
			break;
			case 'boss_gallery':
				$code = 'boss_gallery';
				$this->deleteDataModule($code);
				$this->installModule($code);
				$title = array();
				$description = array();
				foreach($languages as $language){
					$title{$language['language_id']} = 'Sample Banners';
					$description{$language['language_id']} = 'Bag Parallax';
				}
				//create sample data and add module
				$sample_data = array(
					'name' => 'Gallery - Home',
					'code' => $code,
					'status' => 1,
					'boss_gallery_title' => $title,
					'boss_gallery_image' => array(
						0 => array(
							'gallery_image_description' => $description,
							'link' => '#',
							'image' => 'catalog/bt_parallax/gallery1.jpg',
							'class' => '',
						),
						1 => array(
							'gallery_image_description' => $description,
							'link' => '#',
							'image' => 'catalog/bt_parallax/gallery2.jpg',
							'class' => '',
						),
						2 => array(
							'gallery_image_description' => $description,
							'link' => '#',
							'image' => 'catalog/bt_parallax/gallery3.jpg',
							'class' => 'large-width',
						),
						3 => array(
							'gallery_image_description' => $description,
							'link' => '#',
							'image' => 'catalog/bt_parallax/gallery4.jpg',
							'class' => 'large-width',
						),
						4 => array(
							'gallery_image_description' => $description,
							'link' => '#',
							'image' => 'catalog/bt_parallax/gallery5.jpg',
							'class' => '',
						),
						5 => array(
							'gallery_image_description' => $description,
							'link' => '#',
							'image' => 'catalog/bt_parallax/gallery6.jpg',
							'class' => '',
						),
						
					),
				);
				$this->model_extension_module->addModule($code, $sample_data);
				//get module_id
				$module_id = $this->db->getLastId();
				
				$layouts = array(
					0 =>  array(
						'layout_id' => $this->getIdLayout('home'), // home page		
						'position' => 'content_top',
						'sort_order' => 8,
					),									
				);
				foreach($layouts as $layout){
					//add layout		
					$layout_module = array(
						'code'  => $code.'.'.$module_id,
						'position'  => $layout['position'],				
						'sort_order'  => $layout['sort_order'],
					);			
					$layout_id = $layout['layout_id']; 
					$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
				}
			break;
			case 'boss_manufacturer':
				$code = 'boss_manufacturer';
				$this->deleteDataModule($code);
				$this->installModule($code);
				$title = array();
				foreach($languages as $language){
					$title{$language['language_id']} = 'Manufacturer';
				}
				//create sample data and add module
				$sample_data = array(
					'name' => 'Manufacturer',
					'code' => $code,
					'status' => 1,
					'boss_manufacturer_module' => array(
						'title' => $title,										
					),
				);
				$this->model_extension_module->addModule($code, $sample_data);
				//get module_id
				$module_id = $this->db->getLastId();
				
				$layouts = array(
					0 =>  array(
						'layout_id' => $this->getIdLayout('category'), // categpry page		
						'position' => 'column_left',
						'sort_order' => 4,
					),
					1 =>  array(
						'layout_id' => $this->getIdLayout('product'), // product page		
						'position' => 'column_left',
						'sort_order' => 4,
					),
					2 =>  array(
						'layout_id' => $this->getIdLayout('manufacturer'), // manufacture page		
						'position' => 'column_left',
						'sort_order' => 4,
					),					
				);
				foreach($layouts as $layout){
					//add layout		
					$layout_module = array(
						'code'  => $code.'.'.$module_id,
						'position'  => $layout['position'],				
						'sort_order'  => $layout['sort_order'],
					);			
					$layout_id = $layout['layout_id']; 
					$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
				}
			break;
			case 'boss_quickshop':
				$code = 'boss_quickshop';
				$this->deleteDataModule($code);
				$this->installModule($code);
				$title = array();
				foreach($languages as $language){
					$title{$language['language_id']} = 'Quick Shop';
				}
				$contents = array(
					0 => array(
						'position' => 'content_top',
						'sort_order' => 0,
						'layout_id' => $this->getIdLayout('home'),  // home page
					),
					1 => array(
						'position' => 'content_top',
						'sort_order' => 0,
						'layout_id' => $this->getIdLayout('category'),   //category page
					),
					2 => array(
						'position' => 'content_top',
						'sort_order' => 0,
						'layout_id' => $this->getIdLayout('product'),   //product page
					),
				);
				
				//create sample data and add module
				$sample_data = array(
					'name' => 'Boss Quickshop',
					'code' => $code,
					'status' => 1,
					'boss_quickshop_module' => array(
						'title' => $title,
						'array_class_selected' => '.box-product&gt;li,.bt-item-extra&gt;section,.bt-product-large&gt;section,.relt_product&gt;div,.product-list&gt;div, .product-grid&gt;div, .box-product&gt;div',
						'width' => 900,				
					),
				);
				$this->model_extension_module->addModule($code, $sample_data);
				//get module_id
				$module_id = $this->db->getLastId();
				
				foreach($contents as $content){
					//add layout		
					$layout_module = array(
						'code'  => $code.'.'.$module_id,
						'position'  => $content['position'],				
						'sort_order'  => $content['sort_order'],
					);			
					$layout_id = $content['layout_id']; 
					$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
				}
			break;
			case 'boss_tagcloud':
				$code = 'boss_tagcloud';
				$this->deleteDataModule($code);
				$this->installModule($code);
				$title = array();
				foreach($languages as $language){
					$title{$language['language_id']} = 'Popular tags';
				}
				//create sample data and add module
				$sample_data = array(
					'name' => 'Tag Cloud',
					'code' => $code,
					'status' => 1,
					'boss_tagcloud_module' => array(
						'title' => $title,										
						'limit' => 20,										
						'min_font_size' => 9,										
						'max_font_size' => 25,
						'font_weight' => 'normal',						
					),
				);
				$this->model_extension_module->addModule($code, $sample_data);
				//get module_id
				$module_id = $this->db->getLastId();
				
				$layouts = array(
					0 =>  array(
						'layout_id' => $this->getIdLayout('category'), // categpry page		
						'position' => 'column_left',
						'sort_order' => 4,
					),
					1 =>  array(
						'layout_id' => $this->getIdLayout('product'), // product page		
						'position' => 'column_left',
						'sort_order' => 4,
					),
					2 =>  array(
						'layout_id' => $this->getIdLayout('manufacturer'), // manufacture page		
						'position' => 'column_left',
						'sort_order' => 4,
					),					
				);
				foreach($layouts as $layout){
					//add layout		
					$layout_module = array(
						'code'  => $code.'.'.$module_id,
						'position'  => $layout['position'],				
						'sort_order'  => $layout['sort_order'],
					);			
					$layout_id = $layout['layout_id']; 
					$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
				}
			break;
			case 'boss_zoom':
				$code = 'boss_zoom';
				$this->deleteDataModule($code);
				$this->installModule($code);
				$title = array();
				foreach($languages as $language){
					$title{$language['language_id']} = 'Boss Zoom';
				}
				//create sample data and add module
				$sample_data = array(
					'name' => 'Boss Zoom',
					'code' => $code,
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
				$this->model_extension_module->addModule($code, $sample_data);
				//get module_id
				$module_id = $this->db->getLastId();
				
				$layouts = array(					
					0 =>  array(
						'layout_id' => $this->getIdLayout('product'), // product page		
						'position' => 'content_top',
						'sort_order' => 0,
					),
									
				);
				foreach($layouts as $layout){
					//add layout		
					$layout_module = array(
						'code'  => $code.'.'.$module_id,
						'position'  => $layout['position'],				
						'sort_order'  => $layout['sort_order'],
					);			
					$layout_id = $layout['layout_id']; 
					$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
				}
			break;
			case 'html':
				$code = 'html';
				$this->deleteDataModule($code);
				$this->installModule($code);
				$module_description1 = array();
				$module_description2 = array();
				$module_description3 = array();
				$module_description4 = array();
				$module_description5 = array();
				$module_description6 = array();
				$module_description7 = array();
				foreach($languages as $language){
					$module_description1[$language['language_id']]['title'] = '';
					$module_description2[$language['language_id']]['title'] = '';
					$module_description3[$language['language_id']]['title'] = '';
					$module_description4[$language['language_id']]['title'] = '';
					$module_description5[$language['language_id']]['title'] = '';
					$module_description6[$language['language_id']]['title'] = '';
					$module_description7[$language['language_id']]['title'] = '';
					$module_description1[$language['language_id']]['description'] = '&lt;div class=&quot;block-banner-left not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;300&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;Discount&quot;&gt;&lt;img alt=&quot;BagParallax&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/banner.jpg&quot; title=&quot;BagParallax&quot;&gt;&lt;/a&gt;
&lt;p&gt;&lt;span&gt;&lt;span&gt;20%&lt;/span&gt;discount&lt;/span&gt;&lt;/p&gt;
&lt;/div&gt;';
					$module_description2[$language['language_id']]['description'] = '&lt;div class=&quot;block-cate-page not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;400&quot;&gt;&lt;a href=&quot;#&quot; title=&quot;banner category&quot;&gt;&lt;img alt=&quot;banner-category&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/banner_ca.jpg&quot;&gt;&lt;span&gt;&lt;img alt=&quot;banner-category&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/text_banner.png&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;';
					$module_description3[$language['language_id']]['description'] = '&lt;div class=&quot;block-home-shipping&quot;&gt;
&lt;div class=&quot;container&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;col-lg-12 col-md-12 col-sm-12 col-xs-12 not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;300&quot;&gt;
&lt;div&gt;
&lt;span class=&quot;title &quot;&gt;&lt;span&gt;free&lt;/span&gt; shipping &amp;amp; return&lt;/span&gt;
&lt;p&gt;Sed ut perspiciatis unde omnis iste natus error sit voluptatem vista quae ab illo inventore veritatis et quasi architecto beatae.&lt;/p&gt;
&lt;a href=&quot;#&quot; title=&quot;Read more&quot;&gt;Read More&lt;/a&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;';
					$module_description4[$language['language_id']]['description'] = '&lt;div class=&quot;block-home-feature&quot; style=&quot;background-image: url(http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/bg_video.jpg);&quot;&gt;
&lt;div class=&quot;container&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;col-lg-12 col-md-12 col-sm-12 col-xs-12 not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;400&quot;&gt;
&lt;div&gt;
&lt;h3&gt;promotion video&lt;/h3&gt;
&lt;p&gt;let&rsquo;s show an &lt;span&gt;awesome&lt;/span&gt; video of your store&lt;/p&gt;
&lt;div class=&quot;video-content&quot;&gt;&lt;iframe allowfullscreen=&quot;&quot; src=&quot;//www.youtube.com/embed/q82lHEiOkLc&quot; frameborder=&quot;0&quot; height=&quot;480&quot; width=&quot;800&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;';
					$module_description5[$language['language_id']]['description'] = '&lt;div class=&quot;block-home-feature main-bg&quot; style=&quot;background-image: url(http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/bg_feature.jpg);&quot;&gt;
&lt;div class=&quot;container&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;col-lg-12 col-md-12 col-sm-12 col-xs-12 not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;200&quot;&gt;
&lt;div&gt;
&lt;h3&gt;some features&lt;/h3&gt;
&lt;p&gt;what will make you purchase this &lt;span&gt;gorgeous&lt;/span&gt; theme&lt;/p&gt;
&lt;div class=&quot;block-feature-detail not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;400&quot;&gt;
&lt;div class=&quot;feature feature-1 col-lg-3 col-md-3 col-sm-3 col-xs-12&quot;&gt;&lt;a class=&quot;image&quot; hrel=&quot;#&quot; title=&quot;&quot;&gt;&lt;img alt=&quot;design&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/banner_icon1.png&quot;&gt;&lt;/a&gt; &lt;span&gt;parallax design&lt;/span&gt;
&lt;p&gt;Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates.&lt;/p&gt;
&lt;a class=&quot;learn-more&quot; href=&quot;#&quot; title=&quot;Learn More&quot;&gt;learn more&lt;/a&gt;&lt;/div&gt;
&lt;div class=&quot;feature feature-2 col-lg-3 col-md-3 col-sm-3 col-xs-12&quot;&gt;&lt;a class=&quot;image&quot; hrel=&quot;#&quot; title=&quot;&quot;&gt;&lt;img alt=&quot;features&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/banner_icon2.png&quot;&gt;&lt;/a&gt; &lt;span&gt;cool features&lt;/span&gt;
&lt;p&gt;Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates.&lt;/p&gt;
&lt;a class=&quot;learn-more&quot; href=&quot;#&quot; title=&quot;Learn More&quot;&gt;learn more&lt;/a&gt;&lt;/div&gt;
&lt;div class=&quot;feature feature-3 col-lg-3 col-md-3 col-sm-3 col-xs-12&quot;&gt;&lt;a class=&quot;image&quot; hrel=&quot;#&quot; title=&quot;&quot;&gt;&lt;img alt=&quot;customize&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/banner_icon3.png&quot;&gt;&lt;/a&gt; &lt;span&gt;easy to customize&lt;/span&gt;
&lt;p&gt;Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates.&lt;/p&gt;
&lt;a class=&quot;learn-more&quot; href=&quot;#&quot; title=&quot;Learn More&quot;&gt;learn more&lt;/a&gt;&lt;/div&gt;
&lt;div class=&quot;feature feature-4 col-lg-3 col-md-3 col-sm-3 col-xs-12&quot;&gt;&lt;a class=&quot;image&quot; hrel=&quot;#&quot; title=&quot;&quot;&gt;&lt;img alt=&quot;support&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/banner_icon4.png&quot;&gt;&lt;/a&gt; &lt;span&gt;dedicated support&lt;/span&gt;
&lt;p&gt;Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates.&lt;/p&gt;
&lt;a class=&quot;learn-more&quot; href=&quot;#&quot; title=&quot;Learn More&quot;&gt;learn more&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;bt-buytheme &quot;&gt;&lt;a class=&quot;btn btn-primary&quot; href=&quot;#&quot; title=&quot;Buy This Theme&quot;&gt;buy this themes&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;';
					$module_description6[$language['language_id']]['description'] = '&lt;div class=&quot;container&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;col-xs-12 col-sm-12 col-md-12 not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;300&quot;&gt;
&lt;div class=&quot;block-home-testimonial&quot;&gt;
&lt;h1&gt;testimonials&lt;/h1&gt;
&lt;p&gt;&ldquo;Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, cumque nihil impedit quo minus id quod maxime omnis voluptas assumenda est, omnis dolor repellendus.&rdquo;&lt;/p&gt;
&lt;span&gt;david lorem, customer.&lt;/span&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;';
					$module_description7[$language['language_id']]['description'] = '&lt;div class=&quot;container&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;col-lg-12 col-md-12 col-sm-12 col-xs-12 not-animated&quot; data-animate=&quot;fadeInUp&quot; data-delay=&quot;400&quot;&gt;
&lt;div class=&quot;block-hompage-special&quot;&gt;
&lt;h1&gt;What&rsquo;s Special for Today?&lt;/h1&gt;
&lt;p&gt;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.&lt;/p&gt;
&lt;div class=&quot;block-content&quot;&gt;
&lt;div class=&quot;row&quot;&gt;
&lt;div class=&quot;block block-1 col-lg-4 col-md-4 col-sm-4 col-xs-12&quot;&gt;
&lt;div&gt;&lt;a href=&quot;#&quot; title=&quot;Parallax special&quot;&gt;&lt;img alt=&quot;discount&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/home_banner1.jpg&quot;&gt;&lt;span class=&quot;center&quot;&gt;&lt;span class=&quot;title&quot;&gt;&lt;span&gt;20%&lt;/span&gt; discount&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;block block-2 col-lg-4 col-md-4 col-sm-4 col-xs-12&quot;&gt;
&lt;div&gt;&lt;a href=&quot;#&quot; title=&quot;Parallax special&quot;&gt;&lt;img alt=&quot;discount&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/home_banner2.jpg&quot;&gt;&lt;span class=&quot;center&quot;&gt;&lt;span class=&quot;title&quot;&gt;star&rsquo;s wearing&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;block block-3 col-lg-4 col-md-4 col-sm-4 col-xs-12&quot;&gt;
&lt;div&gt;&lt;a href=&quot;#&quot; title=&quot;Parallax special&quot;&gt;&lt;img alt=&quot;discount&quot; src=&quot;http://demo.bossthemes.com/parallax_v2/image/catalog/bt_parallax/home_banner3.jpg&quot;&gt;&lt;span class=&quot;center&quot;&gt;&lt;span class=&quot;title&quot;&gt;special &lt;span&gt;gift&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;';
				}
				$contents = array(
					0 => array(
						'name' => 'Banner - Left',
						'module_description' => $module_description1,
						'layout' => array(
							0 => array(
								'position' => 'column_left',
								'sort_order' => 5,
								'layout_id' => $this->getIdLayout('category'),  // category page
							),
							1 => array(
								'position' => 'column_left',
								'sort_order' => 5,
								'layout_id' => $this->getIdLayout('product'),  // product page
							),
							2 => array(
								'position' => 'column_left',
								'sort_order' => 5,
								'layout_id' => $this->getIdLayout('manufacturer'),  // Manufacturer page
							),
						),
						
					),					
					1 => array(
						'name' => 'Banner Category',
						'module_description' => $module_description2,
						'position' => 'content_top',
						'sort_order' => 1,
						'layout_id' => $this->getIdLayout('category'),   //category page
					),
					2 => array(
						'name' => 'Free shipping & Return',
						'module_description' => $module_description3,
						'position' => 'content_top',
						'sort_order' => 5,
						'layout_id' => $this->getIdLayout('home'),   //home page
					),
					3 => array(
						'name' => 'Promotion Video',
						'module_description' => $module_description4,
						'position' => 'content_top',
						'sort_order' => 7,
						'layout_id' => $this->getIdLayout('home'),   //home page
					),
					4 => array(
						'name' => 'Some Features',
						'module_description' => $module_description5,
						'position' => 'content_top',
						'sort_order' => 3,
						'layout_id' => $this->getIdLayout('home'),   //home page
					),
					5=> array(
						'name' => 'Testimonials',
						'module_description' => $module_description6,
						'position' => 'content_top',
						'sort_order' => 9,
						'layout_id' => $this->getIdLayout('home'),   //home page
					),
					6 => array(
						'name' => 'What\'s Special for Today?',
						'module_description' => $module_description7,
						'position' => 'content_top',
						'sort_order' => 1,
						'layout_id' => $this->getIdLayout('home'),   //home page
					),
				);
				foreach($contents as $content){
					//create sample data and add module
					$sample_data = array(
						'name' => $content['name'],
						'code' => $code,
						'status' => 1,
						'module_description' => $content['module_description'],
					);
					$this->model_extension_module->addModule($code, $sample_data);
					//get module_id
					$module_id = $this->db->getLastId();
				
					if(isset($content['layout'])){
						foreach($content['layout'] as $layout){
							//add layout		
							$layout_module = array(
								'code'  => $code.'.'.$module_id,
								'position'  => $layout['position'],				
								'sort_order'  => $layout['sort_order'],
							);			
							$layout_id = $layout['layout_id']; 
							$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
						}
					}else{
						//add layout		
							$layout_module = array(
								'code'  => $code.'.'.$module_id,
								'position'  => $content['position'],				
								'sort_order'  => $content['sort_order'],
							);			
							$layout_id = $content['layout_id']; 
							$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
					}
				}
			break;
			case 'boss_newmegamenu':
				$code = 'boss_newmegamenu';
				$this->deleteDataModule($code);
				$this->installModule($code);
				
				//create sample data and add module
				$sample_data = array(
					'name' => 'Megamenu',
					'code' => $code,
					'status' => 1,
					'boss_newmegamenu_module' => array(
						'menu_width' => 1180,
						'num_column' => 6,
						'module_id' => '',
						),
				);
				$this->model_extension_module->addModule($code, $sample_data);
				//get module_id
				$module_id = $this->db->getLastId();
				//edit module_id
				$sample_data_edit = array(
					'name' => 'Megamenu',
					'code' => $code,
					'status' => 1,
					'boss_newmegamenu_module' => array(
						'menu_width' => 1180,
						'num_column' => 6,
						'module_id' => $module_id,
						),
				);
				$this->model_extension_module->editModule($module_id, $sample_data_edit);
				
				$layouts = array(					
					0 =>  array(
						'layout_id' => 9999, // all page		
						'position' => 'mainmenu',
						'sort_order' => 0,
					),
									
				);
				foreach($layouts as $layout){
					//add layout		
					$layout_module = array(
						'code'  => $code.'.'.$module_id,
						'position'  => $layout['position'],				
						'sort_order'  => $layout['sort_order'],
					);			
					$layout_id = $layout['layout_id']; 
					$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
				}
				
				
				$this->load->model('bossthemes/boss_newmegamenu');
				$this->model_bossthemes_boss_newmegamenu->createdb();
				
				$this->db->query("update " . DB_PREFIX . "megamenu SET module_id = '" . (int)$module_id . "'");
			break;
			case 'boss_revolutionslider':
					$code = 'boss_revolutionslider';
					$this->deleteDataModule($code);
					$this->installModule($code);
					
					//create sample data and add module
					$sample_data = array(
						'name' => 'Slideshow',
						'code' => $code,
						'status' => 1,
						'slider_id' => 24,
					);
					$this->model_extension_module->addModule($code, $sample_data);
					//get module_id
					$module_id = $this->db->getLastId();
					$layouts = array(					
						0 =>  array(
							'layout_id' => $this->getIdLayout('home'), // home page		
							'position' => 'slideshow',
							'sort_order' => 0,
						),
										
					);
					foreach($layouts as $layout){
						//add layout		
						$layout_module = array(
							'code'  => $code.'.'.$module_id,
							'position'  => $layout['position'],				
							'sort_order'  => $layout['sort_order'],
						);			
						$layout_id = $layout['layout_id']; 
						$this->db->query("INSERT INTO " . DB_PREFIX . "layout_module SET layout_id = '" . (int)$layout_id . "', code = '" . $this->db->escape($layout_module['code']) . "', position = '" . $this->db->escape($layout_module['position']) . "', sort_order = '" . (int)$layout_module['sort_order'] . "'");
					}
					
					$this->load->model('bossthemes/boss_revolutionslider');
			
					$this->model_bossthemes_boss_revolutionslider->createdb();
					
				
			break;
			case 'boss_blog':
				$code = 'boss_blog';
				$this->deleteDataModule($code);
				$this->installModule($code);
				$this->load->model('setting/setting');        
				$this->model_setting_setting->deleteSetting('config_bossblog');
				$this->load->model('bossblog/bossblog');					
				$this->model_bossblog_bossblog->dropBlog();
				
				$this->load->model('bossblog/category');					
				$this->model_bossblog_category->checkBlogCategory();
				
				$this->load->model('bossblog/comment');					
				$this->model_bossblog_comment->checkBlogComment();
				
				$this->load->model('bossblog/articles');			
				$this->model_bossblog_articles->checkBlogArticle();
				
				$data = array(
		
					'config_bossblog_name'                  =>'Blog',
					'config_bossblog_limit'             =>5,
					'config_bossblog_admin_limit'           =>5,
					'config_bossblog_comment_status'             =>1,
					'config_bossblog_approval_status'            =>0,
					'config_bossblog_image_category_width' =>880,
					'config_bossblog_image_category_height' =>260,
					'config_bossblog_image_article_width'   =>280,
					'config_bossblog_image_article_height'  =>280,
					'config_bossblog_image_related_width'   =>280,
					'config_bossblog_image_related_height'  =>280,                   
				);
				
				$this->model_setting_setting->editSetting('config_bossblog', $data);
			
			break;	
		}					
	
		$json['output'] = '<i class="fa fa-check-circle"></i> Install module success! go to module page to see the changes';
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
?>