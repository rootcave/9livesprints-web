<?php
/**
 * @link https://developers.facebook.com/docs/howtos/login/server-side-login/
 */

class OAuth2_Adapter_Facebook extends OAuth2_Adapter {
	/*
	 * Standard OAuth URLs
	 */
	protected $authorization_uri = 'https://www.facebook.com/dialog/oauth';
	protected $token_uri = 'https://graph.facebook.com/oauth/access_token';

	/**
	 * @var string
	 */
	protected $api_url = 'https://graph.facebook.com/me';

	/**
	 * permissions to request
	 *
	 * @link https://developers.facebook.com/docs/authentication/permissions/
	 */
	protected $scope = 'email';

	public function __construct($config) {
		$config['CLIENT_ID'] = $config['APP_ID'];
		$config['CLIENT_SECRET'] = $config['SECRET_KEY'];
		parent::__construct($config);
	}

	/**
	 * Method to request access token, called from login()
	 * Extending Adapters may override this.
	 *
	 * @param array $params
	 * @return array
	 */
	protected function getAccessToken($params) {
		/// facebook has this as plain text, not as json
		return (array )$this->fetch($this->token_uri, $params, OAuth2_CURL::HTTP_METHOD_POST, false);
	}

	/**
	 * Keep in sync with AuthAdapterFacebook
	 *
	 * @param $params
	 * @return array
	 * @throws OAuth2_Exception
	 */
	public function profile($params) {
		if (empty($params['access_token'])) {
			throw new OAuth2_Exception("provider access token is required");
		}

		// expires=0 in case of offline_access perm has been granted
		if (!empty($params['expires']) && time() > (int )$params['expires']) {
			throw new OAuth2_Exception("access token has expired");
		}

		$data = array();
		$data['fields'] = 'id,name,picture,first_name,last_name,link,birthday,email,gender';
		$data['access_token'] = $params['access_token'];

		/** @var $result mixed */
		$result = $this->fetch($this->api_url, $data);
		$customer = array();

		/**
		 * For description of the result:
		 *
		 * @link https://developers.facebook.com/docs/reference/api/user/
		 */
		$customer[OAuth2_Consts::CUSTOMER_EXT_ID] = $result->id;
		$customer[OAuth2_Consts::CUSTOMER_DISPLAYNAME] = $result->name;
		$customer[OAuth2_Consts::CUSTOMER_FIRSTNAME] = $result->first_name;
		$customer[OAuth2_Consts::CUSTOMER_LASTNAME] = $result->last_name;
		$customer[OAuth2_Consts::CUSTOMER_AVATAR_URL] = "http://graph.facebook.com/{$result->id}/picture?type=large";
		$customer[OAuth2_Consts::CUSTOMER_PROFILE_URL] = $result->link;
		$customer[OAuth2_Consts::CUSTOMER_EMAIL] = $result->email;
		$customer[OAuth2_Consts::CUSTOMER_VERIFIED_EMAIL] = 1;
		$customer[OAuth2_Consts::CUSTOMER_PHONE] = '';
		$customer[OAuth2_Consts::CUSTOMER_ADAPTER] = $this->getId();

		if (empty($result->birthday)) {
			$customer[OAuth2_Consts::CUSTOMER_BIRTH] = '';
		} else {
			$customer[OAuth2_Consts::CUSTOMER_BIRTH] = strftime("%Y-%m-%d", strtotime($result->birthday));
		}

		$gender = !empty($result->gender) ? strtolower($result->gender) : null;
		if ($gender == 'male') {
			$customer[OAuth2_Consts::CUSTOMER_GENDER] = OAuth2_Consts::CUSTOMER_GENDER_MALE;
		} else if ($gender == 'female') {
			$customer[OAuth2_Consts::CUSTOMER_GENDER] = OAuth2_Consts::CUSTOMER_GENDER_FEMALE;
		} else {
			$customer[OAuth2_Consts::CUSTOMER_GENDER] = '';
		}

		return $customer;
	}

	public function getExternalId($params) {
		$result = $this->fetch($this->api_url, $params);

		if (!empty($result->id)) {
			return $result->id;
		}

		return null;
	}

	// set a different scope for some applications
	public function setScope($key) {
		$config = OAuth2_Config::get('ADAPTERS', $this->adapter_id);
		if (empty($key) || empty($config)) {
			return;
		}
		$key = 'SCOPE_' . strtoupper($key);
		if (!empty($config[$key])) {
			$this->scope = $config[$key];
		}
	}

}
