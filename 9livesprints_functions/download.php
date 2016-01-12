<?php
include_once("download_function.php");
if(isset($_GET['file_path']) && $_GET['file_path']!=''){
	$path=$_GET['file_path'];
	$name=$_GET['file_name'];
	file_download($path,$name='');
	exit;
}
?>