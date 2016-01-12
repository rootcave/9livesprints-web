<?php

/* 
 * Load settings (/config/settings.php) in a globally accesible object
 *
 */

class OAuth2_Config {
    /**
     * @var array
     */
    private static $config = array();

    /**
     * Already computed config values for caching
     *
     * @var array()
     */
    private static $computed = array();

    /**
     * Initialize Config object
     *
     * @param array $settings
     */
    public static function initialize(array $settings) {
        self::$config = $settings;
    }

    /**
     * Get config item
     *
     * @param string $key
     * @param mixed
     */
    public static function get($key = null, $default = null) {
		if ($key === null) {
			return self::$config;
		}

        if (!isset(self::$computed[$key])) {
            self::$computed[$key] = self::searchArray(self::$config, $key, $default);
        }
        return self::$computed[$key];
    }

    private static function searchArray(array $array, $key, $default) {
        $keys = explode('.', $key);
        $key = array_shift($keys);
        if (!isset($array[$key])) {
            return $default;
        }

        if (!$keys) {
            return $array[$key];
        }
        return self::searchArray($array[$key], implode('.', $keys), $default);
    }
}

