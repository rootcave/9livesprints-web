<?php  
class ControllerModuleBossManager extends Controller {
	protected function index() {
	
		$this->document->addScript('catalog/view/javascript/bossthemes/getwidthbrowser.js');
		$this->document->addScript('catalog/view/javascript/bossthemes/cs.bossthemes.js');
		$this->document->addScript('catalog/view/javascript/bossthemes/touchSwipe.min.js');
		$this->document->addScript('catalog/view/javascript/bossthemes/carouFredSel-6.2.0.js');
		$this->document->addScript('catalog/view/javascript/bossthemes/tabs.js');
		$this->document->addScript('catalog/view/javascript/bossthemes/jquery.appear.js');
		
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/font-awesome/css/font-awesome.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/font-awesome/css/font-awesome.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/bossthemes/font-awesome/css/font-awesome.css');
		}
		
		$boss_manager = array(
			'option' => array(
				'bt_scroll_top' => true,
				'sticky_menu'   => false,
				'animation' 	=> true,
				'quick_view'   	=> false
			)
		);
		
		if($this->config->get('boss_manager')){
			$boss_manager = $this->config->get('boss_manager'); 
		}else{
			$boss_manager = $boss_manager;
		}
		if(!empty($boss_manager)){
			$option = $boss_manager['option']; 
		}
		
		if($option['animation']){
			if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/cs.animate.css')) {
				$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/bossthemes/cs.animate.css');
			} else {
				$this->document->addStyle('catalog/view/theme/default/stylesheet/bossthemes/cs.animate.css');
			}
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_manager.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/boss_manager.tpl', $data);
		} else {
			return $this->load->view('default/template/module/boss_manager.tpl', $data);
		}
	}
}
?>