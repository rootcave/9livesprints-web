<?php
include_once("../config.php");
$link = mysql_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD) or die("Could connect to the server");
if ($link){
		mysql_select_db(DB_DATABASE) or die("Database link failed");
}

	if(isset($_GET['cid']) && $_GET['cid']!=''){			
		mysql_query("DELETE FROM " . DB_PREFIX . "hall_of_fame_sell_track WHERE hft_id='".$_GET['cid']."'");
		echo 'request-confirm';				
	}else{		
		echo 'Error!! Please try after some time.';
	}

?>