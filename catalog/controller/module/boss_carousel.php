<?php  
class ControllerModuleBossCarousel extends Controller {
	public function index($setting) {
		if(empty($setting)) return;
		static $module = 0;
		if(isset($setting['boss_carousel_module']['banner_id'])){ 
		
			$this->load->model('design/banner');
			$this->load->model('tool/image');
			
			$this->document->addScript('catalog/view/javascript/bossthemes/touchSwipe.min.js');
			$this->document->addScript('catalog/view/javascript/bossthemes/carouFredSel-6.2.0.js');
			
			$data['limit'] = isset($setting['boss_carousel_module']['limit'])?$setting['boss_carousel_module']['limit']:6;
			
			$data['banners'] = array();
			
			$results = $this->model_design_banner->getBanner($setting['boss_carousel_module']['banner_id']);
			  
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$data['banners'][] = array(
						'title' => $result['title'],
						'link'  => $result['link'],
						'image' => $this->model_tool_image->resize($result['image'], isset($setting['boss_carousel_module']['width'])?$setting['boss_carousel_module']['width']:80, isset($setting['boss_carousel_module']['height'])?$setting['boss_carousel_module']['height']:80)
					);
				}
			}
			
			$data['module'] = $module++; 
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/boss_carousel.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/boss_carousel.tpl', $data);
			} else {
				return $this->load->view('default/template/module/boss_carousel.tpl', $data);
			}
		}
	}
}
?>