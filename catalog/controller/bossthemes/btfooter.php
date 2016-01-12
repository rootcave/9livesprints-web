<?php
class ControllerBossthemesBtFooter extends Controller {
	public function index() {
		$this->load->model('design/layout');

		$layout_id = 9999;

		$data['modules'] = array();
		
		$modules = $this->model_design_layout->getLayoutModules($layout_id, 'btfooter');

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

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/bossthemes/btfooter.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/bossthemes/btfooter.tpl', $data);
		} else {
			return $this->load->view('default/template/bossthemes/btfooter.tpl', $data);
		}
	}
}