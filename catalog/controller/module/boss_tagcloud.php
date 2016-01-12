<?php
class ControllerModuleBossTagCloud extends Controller {

	public function index($setting) {
		if(empty($setting)) return;
		static $module = 0;
		
		$this->load->language('module/boss_tagcloud');

		$data['heading_title'] = isset($setting['boss_tagcloud_module']['title'][$this->config->get('config_language_id')]) ? $setting['boss_tagcloud_module']['title'][$this->config->get('config_language_id')] :'';
		
		$data['text_notags'] = $this->language->get('text_notags');
		
		$this->load->model('bossthemes/boss_tagcloud');
		
		$data['boss_tagcloud'] = $this->model_bossthemes_boss_tagcloud->getRandomTags(
			$setting['boss_tagcloud_module']['limit'],
			(int)$setting['boss_tagcloud_module']['min_font_size'],
			(int)$setting['boss_tagcloud_module']['max_font_size'],
			$setting['boss_tagcloud_module']['font_weight']
		);
		
		$data['module'] = $module++;

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_tagcloud.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/boss_tagcloud.tpl', $data);
		} else {
			return $this->load->view('default/template/module/boss_tagcloud.tpl', $data);
		}
	}
}
?>
