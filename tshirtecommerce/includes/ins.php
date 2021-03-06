<?php
/**
 * @author tshirtecommerce - www.tshirtecommerce.com
 * @date: 2015-01-10
 * 
 * API
 * 
 * @copyright  Copyright (C) 2015 tshirtecommerce.com. All rights reserved.
 * @license    GNU General Public License version 2 or later; see LICENSE
 *
 */
	
require 'libraries'.DS.'instagram.class.php';
class Ins
{
	public function __construct($config)
	{
		session_start();
		$this->instagram = new Instagram($config);
		$this->loginUrl = $this->instagram->getLoginUrl();
		if(empty($_SESSION["code_ins"]))
			$this->code = $_GET['code'];
		else
			$this->code = $_SESSION["code_ins"];	
	}
	
	function login()
	{
		if($this->code == '')
		{
			return $this->loginUrl;
		}
		else
		{
			$token = $this->instagram->getOAuthToken($this->code);
			if ($token->code != 200)
				return $this->loginUrl;
			else
				return false;
		}
	}
	
	//Get all photo. return array(photo_big + photo_medium + photo) or return loginUrl.
	function getAllPhoto($client)
	{
		if($this->code != '')
		{
			$_SESSION["code_ins"] = $this->code;
			if(empty($_SESSION["token_ins"]))
			{
				$token = $this->instagram->getOAuthToken($this->code);
				$_SESSION["token_ins"] = $token;
			}
			else
			{
				$token = $_SESSION["token_ins"];
			}
			$username = $token->user;

			
			if(count($username))
			{				
				//$result = $this->instagram->getUserMedia();
				
				$url = 'https://api.instagram.com/v1/users/'.$username->id.'/media/recent/?client_id='.$client;				
				$result = json_decode(file_get_contents($url));				
				
				if (isset($result->data))
				{
					$data = array();
					foreach($result->data as $key=>$media)
					{
						if($media->type == 'image')
						{
							$data[$key]['photo_big'] = $media->images->standard_resolution->url;
							$data[$key]['photo_medium'] = $media->images->low_resolution->url;
							$data[$key]['photo'] = $media->images->thumbnail->url;
						}
					}
					return $data;
				}
				else
				{
					return array();
				}
				
			}
			else
			{
				return $this->loginUrl;
			} 
		}
	}  
}

?>