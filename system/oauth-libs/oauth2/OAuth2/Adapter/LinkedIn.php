<?php

/**
 * LinkedIn Auth Adapter
 *
 * https://developer.linkedin.com/docs/oauth2
 */

class OAuth2_Adapter_LinkedIn extends OAuth2_Adapter {

	/*
	 * Standard OAuth2 URLs
	 */
	protected $token_uri = 'https://www.linkedin.com/uas/oauth2/accessToken';
	protected $authorization_uri = 'https://www.linkedin.com/uas/oauth2/authorization';


	protected $api_uri = 'https://api.linkedin.com/v1/people/~:(id,first-name,last-name,formatted-name,headline,picture-url,public-profile-url,email-address)?format=json';

	protected $scope = 'r_basicprofile r_emailaddress';

	/**
	 * @link https://developer.linkedin.com/docs/fields/basic-profile
	 *
	 * @throws OAuth2_Exception
	 * @param string $url
	 * @param array $params Authentication Parameters
	 * @return mixed
	 */
	public function profile($params) {

		$curlopts = array(
			CURLOPT_HTTPHEADER => array('Authorization: Bearer ' . $params['access_token']),
		);
		$result = $this->fetch($this->api_uri, $params, OAuth2_CURL::HTTP_METHOD_GET, true, $curlopts);

		if (!empty($result->formattedName)) {
			$customer[OAuth2_Consts::CUSTOMER_DISPLAYNAME] = $result->formattedName;
		} else {
			$customer[OAuth2_Consts::CUSTOMER_DISPLAYNAME] = implode(' ', array($result->firstName, $result->lastName));
		}

		$customer[OAuth2_Consts::CUSTOMER_EXT_ID] = $result->id;
		$customer[OAuth2_Consts::CUSTOMER_FIRSTNAME] = $result->firstName;
		$customer[OAuth2_Consts::CUSTOMER_LASTNAME] = $result->lastName;
		$customer[OAuth2_Consts::CUSTOMER_AVATAR_URL] = $result->pictureUrl;
		$customer[OAuth2_Consts::CUSTOMER_PROFILE_URL] = $result->publicProfileUrl;
		$customer[OAuth2_Consts::CUSTOMER_EMAIL] = $result->emailAddress;
		$customer[OAuth2_Consts::CUSTOMER_VERIFIED_EMAIL] = 1;
		$customer[OAuth2_Consts::CUSTOMER_PHONE] = '';
		$customer[OAuth2_Consts::CUSTOMER_ADAPTER] = $this->getId();
		$customer[OAuth2_Consts::CUSTOMER_BIRTH] = '';
		$customer[OAuth2_Consts::CUSTOMER_GENDER] = '';

		return $customer;
	}

	public function getExternalId($session) {
		return null;
	}
	
}
