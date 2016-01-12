<?php

/**
 * Yahoo Auth Adapter
 *
 * https://developer.yahoo.com/oauth2/guide/
 */

class OAuth2_Adapter_Yahoo extends OAuth2_Adapter {

	/*
	 * Standard OAuth2 URLs
	 */
	protected $token_uri = 'https://api.login.yahoo.com/oauth2/get_token';
	protected $authorization_uri = 'https://api.login.yahoo.com/oauth2/request_auth';


	protected $api_uri = 'https://social.yahooapis.com/v1/user';

	public function __construct($config) {
		$config['CLIENT_ID'] = $config['CONSUMER_KEY'];
		$config['CLIENT_SECRET'] = $config['CONSUMER_SECRET'];
		parent::__construct($config);
	}

	protected function getAccessToken($params) {
		$curlopts = array(CURLOPT_USERPWD => "{$this->clientId}:{$this->clientSecret}");
		return (array )$this->fetch($this->token_uri, $params, OAuth2_CURL::HTTP_METHOD_POST, true, $curlopts);
	}

	public function login($params, array $token_params = array()) {
		// Set paramters tha are necessary for getting access token
		$token_params = array(
			'grant_type' => 'authorization_code',
			'redirect_uri' => urldecode($this->getConnectUrl()),
			'code' => $params['code'],
		);
		return parent::login($params, $token_params);
	}

	/**
	 * @throws OAuth2_Exception
	 * @param string $url
	 * @param array $params Authentication Parameters
	 * @return mixed
	 */
	public function profile($params) {

		/**
		 * $params:
		 *  [oauth_token] => $oauth_token
		 *  [oauth_token_secret] => $oauth_token_secret
		 *  [oauth_expires_in] => 3600
		 *  [oauth_session_handle] => $oauth_session_handle
		 *  [oauth_authorization_expires_in] => 844754726
		 *  [xoauth_yahoo_guid] => $xoauth_yahoo_guid
		 */
		$uri = $this->api_uri . "/{$params['xoauth_yahoo_guid']}/profile";
		$url = OAuth2_CURL::urljoin($uri, array('format' => 'json'));
		$curlopts = array(
			CURLOPT_HTTPHEADER => array('Authorization: Bearer ' . $params['access_token']),
		);
		$result = $this->fetch($url, $params, OAuth2_CURL::HTTP_METHOD_GET, true, $curlopts);
		$profile = $result->profile;

		if (!empty($profile->nickname)) {
			$customer[OAuth2_Consts::CUSTOMER_DISPLAYNAME] = $profile->nickname;
		} else {
			$customer[OAuth2_Consts::CUSTOMER_DISPLAYNAME] = implode(' ', array($profile->givenName, $profile->familyName));
		}

		$customer[OAuth2_Consts::CUSTOMER_EXT_ID] = $profile->guid;
		$customer[OAuth2_Consts::CUSTOMER_FIRSTNAME] = $profile->givenName;
		$customer[OAuth2_Consts::CUSTOMER_LASTNAME] = $profile->familyName;
		$customer[OAuth2_Consts::CUSTOMER_AVATAR_URL] = $profile->image->imageUrl;
		$customer[OAuth2_Consts::CUSTOMER_PROFILE_URL] = $profile->profileUrl;
		$email = array_pop($profile->emails);
		if (!empty($email->handle)) {
			$customer[OAuth2_Consts::CUSTOMER_EMAIL] = $email->handle;
		} else {
			$customer[OAuth2_Consts::CUSTOMER_EMAIL] = '';
		}
		$customer[OAuth2_Consts::CUSTOMER_VERIFIED_EMAIL] = 1;
		$customer[OAuth2_Consts::CUSTOMER_PHONE] = '';
		$customer[OAuth2_Consts::CUSTOMER_ADAPTER] = $this->getId();

		if (!empty($profile->birthYear)) {
			$customer[OAuth2_Consts::CUSTOMER_BIRTH] = $profile->birthYear . '-' . str_replace('/', '-', $profile->birthdate);
		} else {
			$customer[OAuth2_Consts::CUSTOMER_BIRTH] = '';
		}

		$gender = !empty($profile->gender) ? strtolower($profile->gender) : null;
		if ($gender == 'm') {
			$customer[OAuth2_Consts::CUSTOMER_GENDER] = OAuth2_Consts::CUSTOMER_GENDER_MALE;
		} else if ($gender == 'f') {
			$customer[OAuth2_Consts::CUSTOMER_GENDER] = OAuth2_Consts::CUSTOMER_GENDER_FEMALE;
		} else {
			$customer[OAuth2_Consts::CUSTOMER_GENDER] = '';
		}

		return $customer;
	}

	/**
	 * URL to which user should be redirected to for login
	 * @return string
	 */
	public function getLoginUrl() {
		$url = OAuth2_CURL::urljoin($this->authorization_uri, array(
			'client_id' => $this->clientId,
			'response_type' => 'code',
			'redirect_uri' => $this->getConnectUrl(),
		));
		return $url;
	}

	public function getExternalId($session) {
		return null;
	}
	
}
