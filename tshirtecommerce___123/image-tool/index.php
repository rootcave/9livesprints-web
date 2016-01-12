<?php
error_reporting(0);
define('DS', DIRECTORY_SEPARATOR);

$src 	= $_GET['src'];
$src	= 'http://'. $src;
$src 	= str_replace(' ', '%20', $src);

$type = pathinfo($src, PATHINFO_EXTENSION);

$img =  openURL($src);
header("Content-type: image/$type");
echo $img;
exit;

function openURL($url)
{
	
	$domain = $_SERVER['HTTP_HOST'];
	if (strpos($url, $domain) !== false)
	{
		$temp = explode('tshirtecommerce', $url);
		if (count($temp) > 1)
		{
			$file = str_replace('//', '/', $temp[1]);
			$file = str_replace('/', DS, $file);
			$url = dirname(dirname(__FILE__)) .DS. $file;
		}
	}
	
	if( ini_get('allow_url_fopen') )
	{
		$data = file_get_contents($url);
	}
	else
	{		
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		$data = curl_exec($ch);
		curl_close($ch);
	}
	return $data;
}
?>