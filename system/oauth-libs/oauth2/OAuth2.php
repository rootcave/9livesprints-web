<?php
/**
 * OAuth2 client factory for getting adapters
 *
 * @package  OAuth2
 * @author <cyril.tata@delfi.ee>
 */

function OAuth2_autoload($className) {
	if (class_exists($className)) {
		return true;
	}

    if (substr($className, 0, 6) != 'OAuth2') {
		return false;
	}

    $file = str_replace('_', '/', $className);
	$path = dirname(__FILE__) . "/$file.php";
    return include $path;
}

if (!spl_autoload_register('OAuth2_autoload', true, true)) {
	throw new RuntimeException("Unable to redister autoloader 'OAuth2_autoload'");
}

class OAuth2 {
	/**
	 * index to "login"/"customer_id" in OAuth2 cookie
	 */
	const IDX_LOGIN = 0;

	/**
	 * index to "display name" in OAuth2 cookie
	 */
	const IDX_DISPLAY_NAME = 1;

	/**
	 * index to "adapter" in OAuth2 cookie
	 */
	const IDX_ADAPTER = 2;

	// url for login process
	private static $base_url = null;

	// cookie name for OAuth2 cookie
	private static $cookie_name = 'oauth2';

	// ttl for project OAuth2 cookie
	private static $cookie_ttl = 30240000;

	// internal data
	protected static $data;

	/**
	 * Configure OAuth2
	 *
	 * @param string $base_url url which OAuth2 will use for redirecting during login process. It will append necessary params to it
	 * @param string $cookie_name OAuth2 cookie name
	 * @param string $cookie_ttl Time to live for cookie
	 */
	public static function init($base_url, $cookie_name = null, $cookie_ttl = null) {
		self::$base_url = $base_url;

		if ($cookie_name) {
			self::$cookie_name = $cookie_name;
		}

		if ($cookie_ttl) {
			self::$cookie_ttl = $cookie_ttl;
		}
	}

	public static function configure(array $config) {
		OAuth2_Config::initialize($config);
	}

	public static function setCookieName($name) {
		self::$cookie_name = $name;
	}

	public static function setCookieTtl($ttl) {
		self::$cookie_ttl = $ttl;
	}

	/**
	 * Utility function to extract domainname from hostname.
	 *
	 * @static
	 * @param string $hostname
	 * @param int $components
	 * @return string at least $components of $hostname
	 */
	public static function getDomain($hostname = null, $components = 2) {
		if ($hostname === null) {
			$hostname = $_SERVER['HTTP_HOST'];
		}
		return implode('.', array_slice(explode('.', $hostname), -$components));
	}

	/**
	 * Retun OAuth2 data
	 *
	 * @return array
	 */
	private static function getData() {
		if (empty(self::$cookie_name)) {
			throw new OAuth2_Exception("OAuth2 not configured");
		}

		if (empty(self::$data)) {
			$data = !empty($_COOKIE[self::$cookie_name]) ? $_COOKIE[self::$cookie_name] : null;
			if ($data) {
				self::$data = $data;
			}
		}

		return self::$data;
	}

	/**
	 * Returns the configured base url
	 *
	 * @return string
	 */
	public static function getBaseUrl() {
		return self::$base_url;
	}

	/**
	 * Pass a comma separated string of recognised information to OAuth2 data
	 *
	 * @param string $data String must me comma separated value format LOGIN, DISPLAY_NAME, ADAPTER
	 * @param Should session persist or expire on browser close
	 * @throws OAuth2_Exception
	 */
	public static function createSession($data, $permanent = false) {
		if (empty(self::$cookie_name)) {
			throw new OAuth2_Exception("OAuth2 not configured");
		}

		if (is_string($data)) {
			$data = explode(',', $data);
		}

		if (!isset($data[self::IDX_LOGIN])) {
			throw new OAuth2_Exception("Login not found in data");
		}

		if (!isset($data[self::IDX_DISPLAY_NAME])) {
			throw new OAuth2_Exception("Display name not found in data");
		}

		if (!isset($data[self::IDX_ADAPTER])) {
			//@todo validate adapter
			throw new OAuth2_Exception("Adapter not found in data");
		}

		self::$data = implode(',', $data);
		self::setCookie($permanent);
	}

	public static function destroySession() {
		self::deleteCookie();
		self::$data = null;
	}

	public static function getLogin() {
		$data = self::getData();
		if (empty($data)) {
			return null;
		}
		$e = explode(',', $data);
		return $e[self::IDX_LOGIN];
	}

	public static function getDisplayName() {
		$data = self::getData();
		if (empty($data)) {
			return null;
		}
		$e = explode(',', $data);
		return $e[self::IDX_DISPLAY_NAME];
	}

	public static function getAdapterName() {
		$data = self::getData();
		if (empty($data)) {
			return null;
		}
		$e = explode(',', $data);
		return $e[self::IDX_ADAPTER];
	}

	/**
	 * @static
	 * @throws OAuth2_Exception
	 * @param string $adapter_id
	 * @return OAuth2_Adapter
	 */
	public static function getAdapterInstance($adapter_id) {
		return OAuth2_Adapter::getInstance($adapter_id);
	}

	// reset project hash cookie
	private static function deleteCookie() {
		$base_domain = self::getDomain();
		setcookie(self::$cookie_name, '', -1, '/', $base_domain);
	}

	/**
	 * Setup cookie to project domain.
	 *
	 * @static
	 * @param bool $permanent
	 * @return void
	 */
	private static function setCookie($permanent = true) {
		$base_domain = self::getDomain();
		$data = self::getData();
		// set aouth2 cookie
		setcookie(self::$cookie_name, $data, ($permanent ? time() + self::$cookie_ttl : 0), '/', $base_domain);
	}

	/**
	 * Returns a valid user whose id can be used to get profile
	 * @return null|array
	 */
	public static function getUser() {
		$login = self::getLogin();
		if (!$login) {
			return null;
		}

		$name = self::getDisplayName();
		if (!$name) {
			return null;
		}

		$adapter = self::getAdapterName();
		if (!$adapter) {
			return null;
		}

		return array(
			'user_login' => $login,
			'user_display_name' => $name,
			'user_adapter' => $adapter,
		);
	}

	public static function log($msg) {
		if ($msg instanceof Exception) {
			$msg = $msg->getMessage() . "\n" . $msg->getTraceAsString();
		} else {
			$msg = print_r($msg, 1);
		}
		error_log("[OAuth2 Log] $msg");
	}
}
