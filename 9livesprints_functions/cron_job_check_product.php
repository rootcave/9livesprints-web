<?php
include_once("../config.php");
$link = mysql_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD) or die("Could connect to the server");
if ($link){
		mysql_select_db(DB_DATABASE) or die("Database link failed");
}

include_once(DIR_SYSTEM."max_functions.php");


$fetchProduct_10 = mysql_query("SELECT hsc_id,customer_id,hsc_total FROM ".DB_PREFIX."hall_of_fame_sell_count");
if(mysql_num_rows($fetchProduct_10)>0){
	while($obj_10 = mysql_fetch_array($fetchProduct_10)){		
		
		$current_value = $obj_10['hsc_total'];
		$target_value = 10;		

		if($current_value > 10){
			$calculated_value = ($current_value-$target_value);			
			mysql_query("UPDATE ".DB_PREFIX."hall_of_fame_sell_count SET hsc_total = '".$calculated_value."' WHERE hsc_id = '".$obj_10['hsc_id']."'");
			mysql_query("INSERT INTO ".DB_PREFIX."hall_of_fame_sell_track (`customer_id` , `hft_date`) VALUES ('".$obj_10['customer_id']."' , CURDATE())");			
					
		}
	}
}





?>