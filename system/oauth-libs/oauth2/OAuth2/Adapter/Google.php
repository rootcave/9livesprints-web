<?php

/**
 * Google Auth Adapter with OAuth 2
 *
 * @link https://developers.google.com/accounts/docs/OAuth2
 * @link https://developers.google.com/accounts/docs/OAuth2Login
 */

class OAuth2_Adapter_Google extends OAuth2_Adapter {
	/*
	 * Standard OAuth URLs
	 */
	protected $token_uri = 'https://accounts.google.com/o/oauth2/token';
	protected $authorization_uri = 'https://accounts.google.com/o/oauth2/auth';

	/**
	 * Profile Url
	 *
	 * @var string
	 */
	protected $api_url = 'https://www.googleapis.com/oauth2/v1/userinfo';

	/**
	 * scope - permissions scope, separated by " "
	 *
	 * @link https://developers.google.com/accounts/docs/OAuth2Login#scopeparameter
	 */
	//protected $scope = 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile';
	protected $scope = 'openid profile email';

	/**
	 * Fetch Google User Profile
	 *
	 * @see https://code.google.com/apis/contacts/docs/poco/1.0/developers_guide.html#RetrievingUserContact
	 * @link https://developers.google.com/accounts/docs/OAuth2Login#userinfocall
	 * @param array $session
	 * @return array
	 */
	public function profile($session) {
		$result = $this->fetch($this->api_url, $session);

		$customer[OAuth2_Consts::CUSTOMER_DISPLAYNAME] = $result->name;

		if (!empty($result->family_name)) {
			$customer[OAuth2_Consts::CUSTOMER_LASTNAME] = $result->family_name;
		} else {
			$customer[OAuth2_Consts::CUSTOMER_LASTNAME] = '';
		}

		if (!empty($result->given_name)) {
			$customer[OAuth2_Consts::CUSTOMER_FIRSTNAME] = $result->given_name;
		} else {
			$customer[OAuth2_Consts::CUSTOMER_FIRSTNAME] = '';
		}

		if (!empty($result->link)) {
			$customer[OAuth2_Consts::CUSTOMER_PROFILE_URL] = $result->link;
		} else {
			$username = $customer[OAuth2_Consts::CUSTOMER_FIRSTNAME] . ' ' . $customer[OAuth2_Consts::CUSTOMER_LASTNAME];
			$customer[OAuth2_Consts::CUSTOMER_PROFILE_URL] = self::profileGoogleURL(trim($username));
		}

		if (!empty($result->picture)) {
			$customer[OAuth2_Consts::CUSTOMER_AVATAR_URL] = $result->picture;
		} else {
			$customer[OAuth2_Consts::CUSTOMER_AVATAR_URL] = '';
		}
		if (!empty($result->email) && $result->verified_email === true) {
			$customer[OAuth2_Consts::CUSTOMER_EMAIL] = $result->email;
			$customer[OAuth2_Consts::CUSTOMER_VERIFIED_EMAIL] = 1;
		} elseif (!empty($result->email)) {
			$customer[OAuth2_Consts::CUSTOMER_EMAIL] = $result->email;
			$customer[OAuth2_Consts::CUSTOMER_VERIFIED_EMAIL] = '';
		} else {
			$customer[OAuth2_Consts::CUSTOMER_EMAIL] = '';
			$customer[OAuth2_Consts::CUSTOMER_VERIFIED_EMAIL] = '';
		}

		if (empty($result->gender)) {
			$customer[OAuth2_Consts::CUSTOMER_GENDER] = '';

		} else if ($result->gender == 'male') {
			$customer[OAuth2_Consts::CUSTOMER_GENDER] = OAuth2_Consts::CUSTOMER_GENDER_MALE;

		} else if ($result->gender == 'female') {
			$customer[OAuth2_Consts::CUSTOMER_GENDER] = OAuth2_Consts::CUSTOMER_GENDER_FEMALE;
		}

		$customer[OAuth2_Consts::CUSTOMER_PHONE] = '';
		$customer[OAuth2_Consts::CUSTOMER_ADAPTER] = $this->getId();
		$customer[OAuth2_Consts::CUSTOMER_EXT_ID] = $result->id;

		return $customer;
	}

	/**
	 * Return external_id for this adapter
	 *
	 * @param $session Array session data
	 * @return string
	 */
	public function getExternalId($session) {
		$result = $this->fetch($this->api_url, $session);

		if (!empty($result->id)) {
			return $result->id;
		}

		return null;
	}

}