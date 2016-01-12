<?php 
$url = 'http://pro.9file.net/en/admin/user/login';
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
echo $data;
?>
