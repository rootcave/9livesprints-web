<?php

abstract class OAuth2_Adapter {

	public $https = false;

	/**
	 * Whether adapter can fetch profile from network
	 * Some adapters, like Banklink, ID-card do not allow you fetch profile offline
	 */
	public $can_fetch_profile = true;

	/**
	 * @var string
	 */
	protected $adapter_id;

	/**
	 * @var string
	 */
	protected $name;

	/*
	 * Standard OAuth 2.0 URLs
	 */
	protected $token_uri;
	protected $authorization_uri;

	protected $api_url;

	protected $state;

	protected $scope = '';

	protected $clientId;
	protected $clientSecret;

	/**
	 * Adapter configuration method.
	 *
	 * This method gets the whole adapter config block as parameter and should throw an exception
	 * when adapter configuration is invalid.
	 *
	 * @param  $config
	 */
	public function __construct($config) {
		if (empty($config['CLIENT_ID'])) {
			throw new OAuth2_Exception("Configuration error, CLIENT_ID is required");
		}

		if (empty($config['CLIENT_SECRET'])) {
			throw new OAuth2_Exception("Configuration error, CLIENT_SECRET is required");
		}

		$this->clientId = $config['CLIENT_ID'];
		$this->clientSecret = $config['CLIENT_SECRET'];
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
		return (array )$this->fetch($this->token_uri, $params, OAuth2_CURL::HTTP_METHOD_POST);
	}

	/**
	 * Login method called from web with adapter specific parameters.
	 *
	 * After this method is called a valid session should be created that
	 * can be passed as parameter to profile() method.
	 *
	 * @param  $params
	 * @param  $token_params
	 * @return array parameters containing key => val pairs that uniquely identify the session
	 */
	public function login($params, array $token_params = array()) {
		if (!empty($params['error'])) {
			throw new OAuth2_Exception($params['error']);
		}

		if (empty($params['code'])) {
			throw new OAuth2_Exception("code is required");
		}

		// Set paramters tha are necessary for getting access token
		if (!$token_params) {
			$token_params = array(
				'client_id' => $this->clientId,
				'client_secret' => $this->clientSecret,
				'grant_type' => 'authorization_code',
				'code' => $params['code'],
				'redirect_uri' => $this->getConnectUrl(),
			);
		}

		// pack params urlencoded instead of array, or curl will use multipart/form-data as Content-Type
		$token_params = http_build_query($token_params, null, '&');
		// TODO: To access API service after access token expired, need to get another access token with refresh token.
		$result = $this->getAccessToken($token_params);
		if (isset($result['expires'])) {
			// convert to timestamp, as relative expire has no use later
			$result['expires'] = time() + $result['expires'];
		} elseif (isset($result['expires_in'])) {
			// convert to timestamp, as relative expire has no use later
			$result['expires'] = time() + $result['expires_in'];
		}

		// save for debugging
		$result['code'] = $params['code'];

		return $result;
	}

	/**
	 * Retrieve profile method.
	 *
	 * This method should be called with a valid session. What exactly is a valid session is adapter specific.
	 * Some adapters may json_encode an array of key => val pairs into idp.provider_access_token.
	 * Other adapters may just store a single string into idp.provider_access_token.
	 *
	 * For refreshIdpData() to work correctly any adapter must always be consistent with the values it returns.
	 * If the adapter returns CUSTOMER_FIRSTNAME once, it must keep returning it forever, even if it's not present
	 * in the JSON retrieved from external provider. This ensures that customer_data values are also set to
	 * an empty string when provider changes their JSON format or user changes their profile at provider somehow
	 * that a value goes missing from the returned JSON.
	 *
	 * @abstract
	 * @param  $params
	 * @return array array of profile values, adapter specific
	 */
	public abstract function profile($params);

	/**
	 * Retrieve unique ID for this provider.
	 *
	 * @abstract
	 * @param mixed $session
	 * @return string
	 */
	public abstract function getExternalId($session);

	/**
	 * Fetch URL, decodes json response and checks for basic errors
	 *
	 * @throws OAuth2_Exception
	 * @param string $url
	 * @param array $params Url Parameters
	 * @param string $method GET or POST
	 * @param bool $json
	 * @return mixed json decoded data
	 */
	protected function fetch($url, $params = array(), $method = OAuth2_CURL::HTTP_METHOD_GET, $json = true, $curlopts = array()) {
		$content = OAuth2_CURL::HttpRequest($url, $params, $method, $curlopts);

		/** @var $result mixed */
		$result = null;
		if ($json) {
			$result = json_decode($content);
		} else {
			// For Adapters that don't return a json object but a query string
			parse_str($content, $result);
			$result = (object)$result;
		}

		if ($result === null) {
			$url = OAuth2_CURL::urljoin($url, $params);
			OAuth2::log("URL[$url] Content: ", $content);
			throw new OAuth2_Exception("Failed to parse response");
		}

		if (!empty($result->error)) {
			OAuth2::log($result);
			if (isset($result->error->subcode)) {
				throw new OAuth2_Exception($result->error->message, $result->error->code, $result->error->subcode, $result->error->type);

			} elseif (isset($result->error->code)) {
				throw new OAuth2_Exception($result->error->message, $result->error->code, 0, $result->error->type);

			} elseif (isset($result->error->type)) {
				throw new OAuth2_Exception($result->error->message, 0, 0, $result->error->type);

			} elseif (isset($result->error->description)) {
				throw new OAuth2_Exception($result->error->description);

			} else {
				throw new OAuth2_Exception($result->error);
			}
		}

		return $result;
	}

	/**
	 * Get url where adapter should return on connecting.
	 *
	 * @return string
	 */
	public function getConnectUrl() {
		$root_url = OAuth2::getBaseUrl();

		// ensure https connect urls
		if ($this->https) {
			$root_url = str_replace('http:', 'https:', $root_url);
		}

		$params = array(
			'oa2_action' => 'connecting',
			'oa2_adapter' => $this->adapter_id,
			'oa2_state' => $this->state,
		);

		return OAuth2_CURL::urljoin($root_url, $params);
	}

	/**
	 * URL to which user should be redirected to for login
	 * @return string
	 */
	public function getLoginUrl() {
		$url = OAuth2_CURL::urljoin($this->authorization_uri, array(
			'client_id' => $this->clientId,
			'scope' => $this->scope,
			'response_type' => 'code',
			'redirect_uri' => $this->getConnectUrl(),
			'state' => $this->state,
			'display' => 'popup',
		));
		return $url;
	}

	/**
	 * Get Avatar from remote site pointed by URL
	 * Adapters may wish to override this to access protected resource.
	 *
	 * @throws OAuth2_Exception
	 * @param string $url
	 * @param array $params Authentication Parameters
	 * @return string|bool
	 */
	public function getAvatar($url, $params) {
		$info = array();
		$result = OAuth2_CURL::HttpRequest($url, null, OAuth2_CURL::HTTP_METHOD_GET, null, $info);
		if ($info['http_code'] != '200') {
			OAuth2::log($url . ': bad statuscode ' . $info['http_code']);
			return false;
		}

		return $result;
	}

	/**
	 * Get url where adapter should return on when doing cancel.
	 *
	 * @return string
	 */
	public function getCancelUrl() {
		$root_url = OAuth2::getBaseUrl();

		// ensure https connect urls
		if ($this->https) {
			$root_url = str_replace('http:', 'https:', $root_url);
		}

		$params = array(
			'oa2_action' => 'cancel',
			'oa2_adapter' => $this->adapter_id,
			'oa2_state' => $this->state,
		);

		return OAuth2_CURL::urljoin($root_url, $params);
	}

	/**
	 * Normalize Person's Name by converting case
	 *
	 * @static
	 * @param string $str UTF-8 encoded string
	 * @return string
	 */
	public static function normalizeNameCase($str) {
		return mb_convert_case($str, MB_CASE_TITLE, 'UTF-8');
	}

	/**
	 * Return URL for Google search string for $name, in double quotes.
	 *
	 * @static
	 * @param string $name UTF-8 encoded string
	 * @return string
	 */
	public static function profileGoogleURL($name) {
		$term = sprintf('"%s"', $name);
		return "http://www.google.com/search?q=" . urlencode($term);
	}

	/**
	 * Get adapters config, from ../config.php
	 *
	 * @param string $adapter_id
	 * @return array
	 */
	public static function getAdaptersConfig($adapter_id = null) {
		static $config;
		if (!$config) {
			$config = OAuth2_Config::get('ADAPTERS');
		}

		if ($adapter_id == null) {
			return $config;
		}

		if (empty($config[$adapter_id])) {
			return null;
		}

		return $config[$adapter_id];
	}

	/**
	 * @static
	 * @throws OAuth2_Exception
	 * @param string $adapter_id
	 * @return OAuth2_Adapter
	 */
	public static function getInstance($adapter_id) {
		$config = self::getAdaptersConfig($adapter_id);
		if (empty($config)) {
			throw new OAuth2_Exception("Missing configuration for adapter with ID: {$adapter_id}");
		}

		if (empty($config['CLASS_NAME'])) {
			throw new OAuth2_Exception("Adapter instance config missing");
		}

		$adapter = new ReflectionClass($config['CLASS_NAME']);
		/** @var $res OAuth2_Adapter */
		$res = $adapter->newInstance($config);
		$res->adapter_id = $adapter_id;
		$res->name = str_replace('OAuth2_Adapter_', '', $config['CLASS_NAME']);
		return $res;
	}

	/**
	 * Fallback for setting permissions scope
	 *
	 * @param string $scope
	 * @return null;
	 */
	public function setScope($scope) {
		return null;
	}

	public function setState($state) {
		if (is_string($state)) {
			$this->state = $state;
		}
	}

	public function getId() {
		return $this->adapter_id;
	}

}
