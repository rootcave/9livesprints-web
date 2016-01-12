<?php

class ControllerAccountSocialMediaLogin extends Controller {

	private $vars = array();

	private $template_file = 'default/template/module/social_media_login_oauth.tpl';

	public function __construct($registry) {
		parent::__construct($registry);
		if ($this->customer->isLogged()) {
			return $this->isLogged();
		}
		// Set translation strings
		$this->language->load('account/login');
		$this->language->load('module/social_media_login');
		// Load model
		$this->load->model('account/customer');
		// Set module template
		$this->document->setTitle($this->language->get('heading_title'));
		$template = $this->config->get('config_template') . '/template/module/social_media_login_oauth.tpl';
		if (file_exists(DIR_TEMPLATE . $template)) {
			$this->template_file = $template;
		}
		// Init data vars
		$this->vars['success'] = $this->vars['message'] = $this->vars['ajaxurl'] = $this->vars['redirect'] = null;
	}

	public function index() {
		$this->response->redirect($this->url->link('account/login', '', 'SSL'));
	}

	public function oauth2() {
		try {
			$this->initOauth2();
			$action = $this->getParam('oa2_action');
			$state = $this->getParam('oa2_state'); // compare with 'state'
			$adapter_id = $this->getParam('oa2_adapter');
			$ajax = $this->getParam('ajax');
			$params = $this->request->get;
			unset($params['route']);

			if ($ajax !== 'ajax') {
				$params['ajax'] = 'ajax';
				$url = $this->url->link('account/social_media_login/oauth2') . '&' . http_build_query($params);
				$this->vars['ajaxurl'] = html_entity_decode($url);
				$this->vars['message'] = $this->language->get('please_wait');
				return $this->out();
			}

			/** Everything from here should only be handled as an ajax request ajax request */
			if ($action === 'connecting' && ($adapter = $this->getOAuth2Adapter($adapter_id, $state))) {
				$logged = $adapter->login($params);
				// log weirdness
				if (empty($logged['access_token'])) {
					OAuth2::log($logged);
				}
				$profile = $adapter->profile($logged);
				$session = array(
					$profile[OAuth2_Consts::CUSTOMER_EXT_ID],
					$profile[OAuth2_Consts::CUSTOMER_DISPLAYNAME],
					$adapter->getId(),
				);

				$user = $this->createCustomerAndLogin($profile, $logged);
				if (!$user || !$this->customer->isLogged()) {
					$this->vars['success'] = false;
					$this->vars['message'] = $this->language->get('error_retry');
				} else {
					OAuth2::createSession($session);
					$this->vars['success'] = true;
					$this->vars['message'] = $this->language->get('success_login');
					$this->vars['redirect'] = isset($this->session->data['redirect']) ? $this->session->data['redirect'] : $this->url->link('account/account');
				}

				// either output html or ajax here
			} elseif ($action === 'cancel' && ($adapter = $this->getOAuth2Adapter($adapter_id, $state))) {
				$this->vars['success'] = false;
				$this->vars['message'] = $this->language->get('error_retry');
			}
		} catch (OAuth2_Exception $e) {
			$this->logException($e);
			$this->vars['success'] = false;
			$this->vars['message'] = $this->language->get('error_retry');
		}

		$this->outJSON();
	}

	public function oauth() {
		$adapter_id = $this->request->get['oa2_adapter'];
		$oauth_verification = !empty($this->request->get['oauth_verifier']);
		if ($adapter_id === 'twitter') {
			try {
				$this->initOauth();
				$oauth = new TwitterOAuth($this->getConfig('twt_consumer_key'), $this->getConfig('twt_consumer_secret'));
				if ($oauth_verification) {
					$access_token = $oauth->getAccessToken($this->request->get['oauth_verifier'], $this->request->get['oauth_token']);
					$profile = $oauth->profile(array('skip_status' => true));
					if (!empty($profile->errors)) {
						$this->vars['error'] = true;
						$this->vars['success'] = false;
						$this->vars['message'] = $profile->errors[0]->message;
						return $this->out();
					}

					$logged =  array(
						OAuth2_Consts::CUSTOMER_DISPLAYNAME => $profile->screen_name,
						OAuth2_Consts::CUSTOMER_FIRSTNAME => $profile->name,
						OAuth2_Consts::CUSTOMER_EXT_ID => $profile->id_str,
					);
					$user = $this->createCustomerAndLogin(array(), $logged);
					if (!$user || !$this->customer->isLogged()) {
						$this->vars['error'] = true;
						$this->vars['success'] = false;
						$this->vars['message'] = $this->language->get('error_retry');
					} else {
						$this->vars['success'] = true;
						$this->vars['message'] = $this->language->get('success_login');
						$this->vars['redirect'] = isset($this->session->data['redirect']) ? $this->session->data['redirect'] : $this->url->link('account/account');
					}
				} else {
					$oauth_callback = $this->url->link('account/social_media_login/oauth', 'oa2_adapter=twitter');
					$request_token = $oauth->getRequestToken($oauth_callback);
					$authorize_url = $oauth->getAuthorizeURL($request_token);
					$this->response->redirect($authorize_url);
				}
			} catch (Exception $e) {
				$this->logException($e);
				$this->vars['error'] = true;
				$this->vars['success'] = false;
				$this->vars['message'] = $this->language->get('error_retry');
			}
		}

		return $this->out();
	}

	public function login() {
		$adapter_id = $this->getParam('with');
		$state = 'oc_sml_0';
		// HACK for twitter *shit*. Twitter does not follow user-context oauth2 protocol
		if ($adapter_id === 'twitter') {
			$this->initOauth();
			$this->request->get['oa2_adapter'] = $adapter_id;
			return $this->oauth();
		}

		$this->initOauth2();
		$adapter = $this->getOAuth2Adapter($adapter_id, $state);
		if (!$adapter) {
			exit(sprintf($this->language->get('error_no_adapter'), $adapter));
		}

		return $this->response->redirect($adapter->getLoginUrl());
	}

	private function initOauth() {
		require_once DIR_SYSTEM . 'oauth-libs/oauth/OAuth/twitter.php';
		// for constants
		require_once DIR_SYSTEM . '/oauth-libs/oauth2/OAuth2.php';
	}

	private function initOauth2() {
		// Initialize OAuth2 module
		require_once DIR_SYSTEM . '/oauth-libs/oauth2/OAuth2.php';
		OAuth2::init($this->url->link(urlencode('account/social_media_login/oauth2')), 'oc_sml_oauth2');
		OAuth2::configure($this->getOauth2Config());
	}

	private function isLogged() {
		if ($this->getParam('ajax') === 'ajax') {
			$this->vars['success'] = true;
			$this->vars['redirect'] = $this->url->link('account/account', '', 'SSL');
			$this->outJSON();
		}
		return $this->response->redirect($this->url->link('account/account', '', 'SSL'));
	}

	private function createCustomerAndLogin($data, $logged) {
		$params = array_merge($data, $logged);
		$customer = array();
		$customer['email'] = $this->getParam(OAuth2_Consts::CUSTOMER_EMAIL, $params);
		if (!$customer['email']) {
			$email = $this->getParam(OAuth2_Consts::CUSTOMER_DISPLAYNAME, $params) . '-' . $this->getParam(OAuth2_Consts::CUSTOMER_EXT_ID, $params);
			$email .=  '@oauth2-no-email.com';
			$customer['email'] = $email;
		}

		$password = $this->generatePassword($customer, $this->getParam(OAuth2_Consts::CUSTOMER_EXT_ID, $params));
		$customer['password'] = $password;
		$customer['firstname'] = $this->getParam(OAuth2_Consts::CUSTOMER_FIRSTNAME, $params);
		$customer['country_id'] = 0;
		$customer['zone_id'] = 0;
		$customer['company_id'] = '';
		$customer['tax_id'] = '';
		$customer['lastname'] = $this->getParam(OAuth2_Consts::CUSTOMER_LASTNAME, $params);
		$customer['fax'] = '';
		$customer['telephone'] = '';
		$customer['company'] = '';
		$customer['address_1'] = '';
		$customer['address_2'] = '';
		$customer['city'] = '';
		$customer['postcode'] = '';

		if ($this->customer->login($customer['email'], $customer['password'])) {
			return $this->customer;
		}

		$customer_info = $this->model_account_customer->getCustomerByEmail($customer['email']);
		if ($customer_info) {
			$this->model_account_customer->editPassword($customer['email'], $customer['password']);
		} else {
			$config_customer_approval = $this->config->get('config_customer_approval');
			$this->config->set('config_customer_approval', 0);
			$this->model_account_customer->addCustomer($customer);
			$this->config->set('config_customer_approval', $config_customer_approval);
		}

		if ($this->customer->login($customer['email'], $customer['password'])) {
			unset($this->session->data['guest']);
			return $this->customer;
		}
		return false;
	}

	private function out() {
		return $this->response->setOutput($this->load->view($this->template_file, $this->vars));
	}

	private function outJSON() {
		$data = array(
			'success' => $this->vars['success'],
			'message' => $this->vars['message'],
			'redirect' => $this->vars['redirect']
		);

		header('Content-Type: application/json');
		echo json_encode($data);
		exit;
	}

	private function getConfig($key) {
		return $this->config->get('social_media_login_' . $key);
	}

	private function getParam($param, $array = 'get') {
		if (is_array($array)) {
			$params = $array;
		} elseif (is_string($array)) {
			$params = $this->request->{$array};
		} else {
			return '';
		}
		return isset($params[$param]) ? $params[$param] : '';
	}

	private function generatePassword($customer, $salt) {
		$password = md5($customer['email'] . md5($salt));
		$password .= substr($password, 0, 3);
		$password .= substr($password, 0, 3);

		return strtolower($password);
	}

	private function getOauth2Config() {
		$config = array();
		$config['ADAPTERS'] = array(
			'facebook' => array(
				'CLASS_NAME' => 'OAuth2_Adapter_Facebook',
				'APP_ID' => $this->getConfig('fb_app_id'),
				'SECRET_KEY' => $this->getConfig('fb_app_secret'),
				'SCOPE' => 'email',
			),
			'google' => array(
				'CLASS_NAME' => 'OAuth2_Adapter_Google',
				'CLIENT_ID' => $this->getConfig('ggl_client_id'),
				'CLIENT_SECRET' => $this->getConfig('ggl_client_secret'),
			),
			'yahoo' => array(
				'CLASS_NAME' => 'OAuth2_Adapter_Yahoo',
				'CONSUMER_KEY' => $this->getConfig('yao_consumer_key'),
				'CONSUMER_SECRET' => $this->getConfig('yao_consumer_secret'),
			),
			'linkedin' => array(
				'CLASS_NAME' => 'OAuth2_Adapter_LinkedIn',
				'CLIENT_ID' => $this->getConfig('linkedin_consumer_key'),
				'CLIENT_SECRET' => $this->getConfig('linkedin_consumer_secret'),
			),
			'twitter' => array(
				'CLASS_NAME' => 'OAuth2_Adapter_Twitter',
				'CLIENT_ID' => $this->getConfig('twt_consumer_key'),
				'CLIENT_SECRET' => $this->getConfig('twt_consumer_secret'),
			),
		);
		return $config;
	}

	private function getOAuth2Adapter($adapter_id, $state = null) {
		if (empty($adapter_id)) {
			return null;
		}

		try {
			$adapter = OAuth2::getAdapterInstance($adapter_id);
			$adapter->setState($state);
			return $adapter;
		} catch (OAuth2_Exception $ex) {
			$this->logException($ex);
			return null;
		}
	}

	private function logException(Exception $ex) {
		error_log($ex->getMessage());
		error_log($ex->getTraceAsString());
	}
}
