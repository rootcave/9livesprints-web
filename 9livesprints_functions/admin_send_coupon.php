<?php
include_once("../config.php");
$link = mysql_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD) or die("Could connect to the server");
if ($link){
		mysql_select_db(DB_DATABASE) or die("Database link failed");
}

include_once(DIR_SYSTEM."max_functions.php");



		if(isset($_GET['req']) && $_GET['req']!=''){
				
			$get_customer_id = mysql_query("SELECT customer_id FROM " . DB_PREFIX . "hall_of_fame_sell_track WHERE hft_id='".$_GET['req']."'");
			$obj_customer_id = mysql_fetch_array($get_customer_id);
			
			
			$get_customer = mysql_query("SELECT concat( firstname, ' ', lastname ) AS customer_name, email FROM " . DB_PREFIX . "customer WHERE customer_id='". $obj_customer_id['customer_id']."'");

			$obj_customer = mysql_fetch_array($get_customer);

			$mailbody = 'Dear '.$obj_customer['customer_name'].',<br /><br /> Congratulations you have own a free tshirt, please use this coupon code <strong><span style="color:#ff0000;">'.$_GET['cd'].'</span></strong> at www.9livesprints.com<br /><br />Thanks, http://9livesprints.com';
		
			
			sendMail($obj_customer['email'], $obj_customer['customer_name'], "Get Your Free Tshirt at 9livesprints", $mailbody, "info@9livesprints.com", "9livesprints", $html=1, $mailcc='');	

			
			mysql_query("UPDATE ".DB_PREFIX."hall_of_fame_sell_track SET hft_status = 'y' WHERE hft_id = '".$_GET['req']."'");
			
			echo 'request-confirm';	
			
		}else{
			
			echo 'Error!! Please try after some time.';

		}
	






?>