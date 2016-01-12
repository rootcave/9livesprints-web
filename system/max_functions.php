<?php
function sendMail($toMail, $toName, $subject, $textContent, $fromMail, $fromName, $html=1, $mailcc='') {
	//require_once "class.phpmailer.php";
	//require_once "class.smtp.php";
	require_once("class.phpmailer.php");
	require_once("class.smtp.php");
	
	$sendMail = $toMail;

	$sendName = $toName;
	$mailSubject= $subject;
	$mail = new PHPMailer();
	
	$mail->Subject = $mailSubject;
	$mail->From = $fromMail;
	$mail->FromName = $fromName;
	$mail->Body = $textContent;
		
	if($mailcc <> '') {
		$mail->AddCC($mailcc);	
	}

	if($html==1){
		$mail->isHTML(true);
	}

	if(preg_match ("/,/i",$sendMail)){
		$arr=explode(",",$sendMail);
	}
	else{
		$arr[0]=$sendMail;
	}

	foreach ($arr as $val){
		if(preg_match ("/@/i",$val)){
			$name=$val;
			$mail->AddAddress($val, $sendName);
			//$mail->AddBCC("debopam.majilya@gmail.com", "Debopam");
			$mail->AddReplyTo($fromMail, $fromName);
			if(!$mail->Send()){
				$flag=0;
				echo "Message was not sent <p>";
				echo "Mailer Error: " . $mail->ErrorInfo;
				exit;
			}
			else{
				$flag=1;
			}
			$mail->ClearAllRecipients();
		}
	}

	if ($flag==1){
		return true;
	}
	else{
		return false;
	}
}

function file_download($path,$name)
{
	if($name==''){
		$name = basename($path);
	}else{
		$name = $name;
	}

	$file = $path;		
	
	$filename = basename($file);
	
	$file_extension = strtolower(substr(strrchr($filename,"."),1));
	$download_size = filesize($file);
	switch( $file_extension )
	{
	  case "pdf": $ctype="application/pdf"; break;
	  case "exe": $ctype="application/octet-stream"; break;
	  case "zip": $ctype="application/zip"; break;
	  case "doc": $ctype="application/msword"; break;
	  case "docx": $ctype="application/msword"; break;
	  case "xls": $ctype="application/vnd.ms-excel"; break;
	  case "ppt": $ctype="application/vnd.ms-powerpoint"; break;
	  case "gif": $ctype="image/gif"; break;
	  case "png": $ctype="image/png"; break;
	  case "jpeg":
	  case "jpg": $ctype="image/jpg"; break;
	  default: $ctype="application/force-download";
	}
	header("Expires: 0");
	header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
	header("Cache-Control: private",false); 
	//header("Content-Description: File Transfer");
	//Use the switch-generated Content-Type
	header("Content-Type: $ctype");
	header('Content-Transfer-Encoding: Binary'); 
	//Force the download
	header("Accept-Ranges: bytes");
	header("Content-Length: $download_size"); 
	//header('Content-Disposition: attachment; filename="'.$filename.'";'); // suman

	header('Content-Disposition: attachment; filename="'.$name.'";');


	/* /////////////////////////////
	header("Pragma: public"); // required
	header("Expires: 0");
	header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
	header("Cache-Control: private",false); // required for certain browsers 
	header("Content-Type: $ctype");
	// change, added quotes to allow spaces in filenames, by Rajkumar Singh
	header("Content-Disposition: attachment; filename=\"".basename($name)."\";" );
	header("Content-Transfer-Encoding: binary");
	header("Content-Length: ".filesize($name));
	//////////////////////////// */

	//ob_end_clean();
		
	readfile($file);
}





?>