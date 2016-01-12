<?php
class ControllerModuleSocialMediaLogin extends Controller {

	private $vars = array();

	private $template_file = 'default/template/module/social_media_login.tpl';

	public function index() {
		$url = $this->url;
		$lang_id = (int)$this->config->get('config_language_id');
		$this->language->load('module/social_media_login');

		$this->vars['heading_title'] = $this->language->get('heading_title');
		$this->vars['customer_logged'] = $this->customer->isLogged();
		$this->vars['sml_adapter_url'] = $url->link('account/social_media_login/login');

		$this->vars['fb_adapter_url'] = $url->link('account/social_media_login/login', 'with=facebook');
		$this->vars['fb_enabled'] = $this->get_config('fb_status');
		$this->vars['fb_button_name'] = $this->get_config('fb_button_name_' . $lang_id);

		$this->vars['twt_adapter_url'] = $url->link('account/social_media_login/login', 'with=twitter');
		$this->vars['twt_enabled'] = $this->get_config('twt_status');
		$this->vars['twt_button_name'] = $this->get_config('twt_button_name_' . $lang_id);

		$this->vars['ggl_adapter_url'] = $url->link('account/social_media_login/login', 'with=google');
		$this->vars['ggl_enabled'] = $this->get_config('ggl_status');
		$this->vars['ggl_button_name'] = $this->get_config('ggl_button_name_' . $lang_id);

		$this->vars['yao_adapter_url'] = $url->link('account/social_media_login/login', 'with=yahoo');
		$this->vars['yao_enabled'] = $this->get_config('yao_status');
		$this->vars['yao_button_name'] = $this->get_config('yao_button_name_' . $lang_id);

		$template = $this->config->get('config_template') . '/template/module/social_media_login.tpl';
		if (file_exists(DIR_TEMPLATE . $template)) {
			$this->template_file = $template;
		}

		return $this->load->view($this->template_file, $this->vars);
	}

	protected function get_config($key) {
		$key = 'social_media_login_' . $key;
		return $this->config->get($key);
	}

	protected function isHTTPS() {
		return isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'));
	}

}
