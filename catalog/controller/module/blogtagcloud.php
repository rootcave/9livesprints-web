<?php
class ControllerModuleBlogTagCloud extends Controller {
	
	public function index($setting) {
		if(empty($setting)) return;
		static $module = 0;
		
		$this->load->language('module/blogtagcloud');
		$boss_blogtagcloud = $setting['blogtagcloud_module'];
		$data['heading_title'] = isset($boss_blogtagcloud['title'][$this->config->get('config_language_id')])?$boss_blogtagcloud['title'][$this->config->get('config_language_id')]:'';
		
		$data['text_notags'] = $this->language->get('text_notags');

        if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/bossblog.css')){
		$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/bossblog.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/bossthemes/bossblog.css');
		}
        		
		$this->load->model('bossblog/blogtagcloud');
		
		$data['blogtagcloud'] = $this->model_bossblog_blogtagcloud->getRandomTags(
			$boss_blogtagcloud['limit'],
			(int)$boss_blogtagcloud['min_font_size'],
			(int)$boss_blogtagcloud['max_font_size'],
			$boss_blogtagcloud['font_weight']
		);
		
		$data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blogtagcloud.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/blogtagcloud.tpl', $data);
		} else {
			return $this->load->view('default/template/module/blogtagcloud.tpl', $data);
		}
	}
}
?>
