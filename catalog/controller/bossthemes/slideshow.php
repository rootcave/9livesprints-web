<?php
class ControllerBossthemesSlideshow extends Controller {
	public function index() {
		$this->load->model('design/layout');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('catalog/information');
		$this->load->model('extension/module');

		if (isset($this->request->get['route'])) {
			$route = (string)$this->request->get['route'];
		} else {
			$route = 'common/home';
		}

		$layout_id = 0;

		if (!$layout_id && $route == 'common/home') {
			$layout_id = $this->model_design_layout->getLayout($route);
		}

		if (!$layout_id) {
			$layout_id = 9999;
		}

		$data['modules'] = array();
		
		$modules = $this->model_design_layout->getLayoutModules($layout_id, 'slideshow');
		foreach ($modules as $module) {
			$part = explode('.', $module['code']);
			
			if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
				$data['modules'][] = $this->load->controller('module/' . $part[0]);
			}
			
			if (isset($part[1])) {
				$setting_info = $this->model_extension_module->getModule($part[1]);
				
				if ($setting_info && $setting_info['status']) {
					$data['modules'][] = $this->load->controller('module/' . $part[0], $setting_info);
				}
			}
			
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/bossthemes/slideshow.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/bossthemes/slideshow.tpl', $data);
		} else {
			return $this->load->view('default/template/bossthemes/slideshow.tpl', $data);
		}
	}
}