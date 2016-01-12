<?php
include_once("../config.php");
$link = mysql_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD) or die("Could connect to the server");
if ($link){
		mysql_select_db(DB_DATABASE) or die("Database link failed");
}

if(isset($_GET['cid']) && $_GET['cid']!=''){	
	

	if(isset($_GET['order_id']) && $_GET['order_id']!=''){
		$od = $_GET['order_id'];
	}else{
		$od = '0';
	}

	
	mysql_query("INSERT INTO " . DB_PREFIX . "tshirtecommerce_clipart_use (`clipart_id`, `clipart_title`, `clipart_thumb`, `order_key`, `order_id`) VALUES ('".$_GET['cid']."', '".mysql_real_escape_string(stripslashes($_GET['ctitle']))."', '".mysql_real_escape_string(stripslashes($_GET['cthumb']))."', '".mysql_real_escape_string(stripslashes($_GET['ckey']))."' , '".$od."')");
	
	echo 'request-confirm';
	
}else{		
	echo 'Error!! Refresh the page and try again.';
}

?>