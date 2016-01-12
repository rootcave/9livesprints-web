<?php

class ControllerModuleSocialMediaLogin extends Controller {

	private $error = array();

	private $lang = array();

	private $vars = array();

	public function index() {
		$this->lang = $this->language->load('module/social_media_login');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('setting/setting');

		// create catalog redirect url
		$url = new Url(HTTP_CATALOG, $this->config->get('config_secure') ? HTTP_CATALOG : HTTPS_CATALOG);
		$this->vars['fb_redirect_url'] = $this->oauth2_redirect_uri($url, 'facebook');
		$this->vars['twt_redirect_url'] = $this->oauth2_redirect_uri($url, 'twitter');
		$this->vars['ggl_redirect_url'] = $this->oauth2_redirect_uri($url, 'google');
		$this->vars['yao_redirect_url'] = $this->oauth2_redirect_uri($url, 'yahoo');

		if (!empty($this->session->data['success'])) {
			$this->vars['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		}

		if ($this->posted() && $this->validate()) {
			$post = $this->request->post;
			$this->request->post['social_media_login_fb_status'] = (int) isset($post['social_media_login_fb_status']);
			$this->request->post['social_media_login_twt_status'] = (int) isset($post['social_media_login_twt_status']);
			$this->request->post['social_media_login_ggl_status'] = (int) isset($post['social_media_login_ggl_status']);
			$this->request->post['social_media_login_yao_status'] = (int) isset($post['social_media_login_yao_status']);
			$this->request->post['social_media_login_status'] = (int) isset($post['social_media_login_status']);

			$this->model_setting_setting->editSetting('social_media_login', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->load->model('localisation/language');
		$this->vars['languages'] = $this->model_localisation_language->getLanguages();

		// set translations and bread crumbs
		$this->setTranslations();
		$this->setBreadCrumbs();
		$this->setPositions();

		// set error messages
		if ($this->error) {
			$this->vars = array_merge($this->vars, $this->error);
		}

		$this->vars['action'] = $this->url->link('module/social_media_login', 'token=' . $this->session->data['token'], 'SSL');
		$this->vars['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		// set form vars
		$form_vars = array(
			'fb_app_id', 'fb_app_secret', 'fb_button_name', 'fb_status', 'fb_redirect_url',
			'twt_consumer_key', 'twt_consumer_secret', 'twt_button_name', 'twt_status', 'twt_redirect_url',
			'ggl_client_id', 'ggl_client_secret', 'ggl_button_name', 'ggl_status', 'ggl_redirect_url',
			'yao_consumer_key', 'yao_consumer_secret', 'yao_button_name', 'yao_status', 'yao_redirect_url',
			'status',
		);

		foreach ($form_vars as $var) {
			if (strpos($var, '_button_name') !== false) {
				foreach ($this->vars['languages'] as $language) {
					$var = 'social_media_login_' . $var . '_' . $language['language_id'];
					$this->set_var($var);
				}
			} else {
				$var = "social_media_login_$var";
				$this->set_var($var);
			}
		}
/*
		$this->vars['modules'] = array();
		if (isset($this->request->post['social_media_login_module'])) {
			$this->vars['modules'] = $this->request->post['social_media_login_module'];
		} elseif ($this->config->get('social_media_login_module')) {
			$this->vars['modules'] = $this->config->get('social_media_login_module');
		}


		$this->load->model('design/layout');

		$this->vars['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/social_media_login.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
*/
		$this->vars['header'] = $this->load->controller('common/header');
        $this->vars['column_left'] = $this->load->controller('common/column_left');
        $this->vars['footer'] = $this->load->controller('common/footer');
		$this->vars['module'] = $this;

        $this->response->setOutput($this->load->view('module/social_media_login.tpl', $this->vars));
	}

	public function error($key) {
		if (isset($this->vars['error_' . $key])) {
			return $this->vars['error_' . $key];
		}
	}

	public function form_value($okey, $default = '', $type = '') {
		$key = 'social_media_login_' . $okey;
		$value = '';

		if (isset($this->vars[$okey])) {
			$value = $this->vars[$okey];
		} elseif (isset($this->vars[$key])) {
			$value = $this->vars[$key];
		} elseif (!$type) {
			$value = $default;
		}

		if (in_array($type, array('checkbox', 'radio'))) {
			return $value == $default ? 'checked="checked"' : null;
		}

		if ($type == 'select') {
			return $value == $default ? 'selected="selected"' : null;
		}

		return $value;
	}

	protected function validate() {
		$post = $this->request->post;

		if (!$this->user->hasPermission('modify', 'module/social_media_login')) {
			$this->error['error_warning'] = $this->language->get('error_permission');
		}

		// if facebook is enabled, validate app id and app secret
		if (!empty($post['social_media_login_fb_status'])) {
			if (!$post['social_media_login_fb_app_id']) {
				$this->error['error_fb_app_id'] = $this->language->get('error_fb_app_id');
			}

			if (!$post['social_media_login_fb_app_secret']) {
				$this->error['error_fb_app_secret'] = $this->language->get('error_fb_app_secret');
			}
		}

		// if twitter is enabled, validate app id and app secret
		if (!empty($post['social_media_login_twt_status'])) {
			if (!$post['social_media_login_twt_consumer_key']) {
				$this->error['error_twt_app_key'] = $this->language->get('error_twt_app_key');
			}

			if (!$post['social_media_login_twt_consumer_secret']) {
				$this->error['error_twt_app_secret'] = $this->language->get('error_twt_app_secret');
			}
		}
		
		// if google is enabled, validate app id and app secret
		if (!empty($post['social_media_login_ggl_status'])) {
			if (!$post['social_media_login_ggl_client_id']) {
				$this->error['error_ggl_app_id'] = $this->language->get('error_ggl_app_id');
			}

			if (!$post['social_media_login_ggl_client_secret']) {
				$this->error['error_ggl_app_secret'] = $this->language->get('error_ggl_app_secret');
			}
		}

		// if yahoo is enabled, validate app id and app secret
		if (!empty($post['social_media_login_yao_status'])) {
			if (!$post['social_media_login_yao_consumer_key']) {
				$this->error['error_yao_app_key'] = $this->language->get('error_yao_app_key');
			}

			if (!$post['social_media_login_yao_consumer_secret']) {
				$this->error['error_yao_app_secret'] = $this->language->get('error_yao_app_secret');
			}
		}

		if (!$this->error) {
			return true;
		} else {
			$this->vars['error'] = nl2br(implode("\n", $this->error));
			return false;
		}
	}

	protected function setTranslations() {
		foreach ($this->lang as $var => $text) {
			$this->vars[$var] = $text;
		}
	}

	protected function setBreadCrumbs() {
		$this->vars['breadcrumbs'] = array();

		$this->vars['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->vars['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->vars['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/social_media_login', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);
	}

	protected function setPositions() {
		$this->vars['positions'] = array(
			'content_top' => $this->lang['text_content_top'],
			'content_bottom' => $this->lang['text_content_bottom'],
			'column_left' => $this->lang['text_column_left'],
			'column_right' => $this->lang['text_column_right'],
			'social_media_login_buttons_position' => $this->lang['text_social_btns'],
		);
	}

	protected function posted() {
		return $this->request->server['REQUEST_METHOD'] == 'POST';
	}

	private function set_var($var) {
		if (isset($this->request->post[$var])) {
			$this->vars[$var] = $this->request->post[$var];
		} else {
			$this->vars[$var] = $this->config->get($var);
		}
	}

	private function oauth2_redirect_uri(Url $url, $adapter) {
		return $url->link(urlencode('account/social_media_login/oauth2'), "oa2_action=connecting&oa2_adapter=$adapter&oa2_state=oc_sml_0");
	}

}

?>