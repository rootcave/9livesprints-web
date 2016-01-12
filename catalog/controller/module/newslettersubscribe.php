<?php  
class ControllerModuleNewslettersubscribe extends Controller {
  	private $error = array();
	
	public function index($setting){
		if(empty($setting)) return;
	   $data['title'] = isset($setting['newslettersubscribe_module']['title'][$this->config->get('config_language_id')])?$setting['newslettersubscribe_module']['title'][$this->config->get('config_language_id')]:'';
	   
	   $this->load->language('module/newslettersubscribe');

      	$data['heading_title'] = $this->language->get('heading_title');	
		
      	$data['entry_name'] = $this->language->get('entry_name');	
      	$data['entry_email'] = $this->language->get('entry_email');	
		
      	$data['entry_button'] = $this->language->get('entry_button');	
		
      	$data['entry_unbutton'] = $this->language->get('entry_unbutton');	
		
      	$data['option_unsubscribe'] = isset($setting['option_unsubscribe'])?$setting['option_unsubscribe']:'';	
		
      	$data['option_fields'] = isset($setting['newslettersubscribe_option_field'])?$setting['newslettersubscribe_option_field']:'';	
		
		$data['option_fields1'] = isset($setting['newslettersubscribe_option_field1'])?$setting['newslettersubscribe_option_field1']:'';	
		$data['option_fields2'] = isset($setting['newslettersubscribe_option_field2'])?$setting['newslettersubscribe_option_field2']:'';	
		$data['option_fields3'] = isset($setting['newslettersubscribe_option_field3'])?$setting['newslettersubscribe_option_field3']:'';	
		$data['option_fields4'] = isset($setting['newslettersubscribe_option_field4'])?$setting['newslettersubscribe_option_field4']:'';	
		$data['option_fields5'] = isset($setting['newslettersubscribe_option_field5'])?$setting['newslettersubscribe_option_field5']:'';	
		$data['option_fields6'] = isset($setting['newslettersubscribe_option_field6'])?$setting['newslettersubscribe_option_field6']:'';
		$data['module_id'] = isset($setting['newslettersubscribe_module']['module_id'])?$setting['newslettersubscribe_module']['module_id']:'';
		
		$data['text_subscribe'] = $this->language->get('text_subscribe');	
		$data['text_email'] = $this->language->get('text_email');	
		$data['text_sub_title'] = $this->language->get('text_sub_title');	
		
		
		$this->id = 'newslettersubscribe';
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/newslettersubscribe.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/newslettersubscribe.tpl', $data);
		} else {
			return $this->load->view('default/template/module/newslettersubscribe.tpl', $data);
		}
	   
	    $this->load->model('account/newslettersubscribe');
	   //check db
	    $this->model_account_newslettersubscribe->check_db();
	}
	
	public function subscribe(){	
		if(!isset($this->request->get['module_id']) || !$this->request->get['module_id'])
			return;	
		$this->load->model('extension/module');
		$setting_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		//echo "<pre>"; print_r($setting_info); echo "</pre>"; die();
		
		if(isset($setting_info['newslettersubscribe_thickbox']) && $setting_info['newslettersubscribe_thickbox']){
		  $prefix_eval = "";
		}else{
		  $prefix_eval = "";
		}
		$json = array();
		$this->language->load('module/newslettersubscribe');
	  
		$this->load->model('account/newslettersubscribe');
		  
		if(isset($this->request->post['subscribe_email']) && filter_var($this->request->post['subscribe_email'],FILTER_VALIDATE_EMAIL)){
			   
			if(isset($setting_info['newslettersubscribe_registered']) && $setting_info['newslettersubscribe_registered'] && $this->model_account_newslettersubscribe->checkRegisteredUser($this->request->post)){
				$this->model_account_newslettersubscribe->UpdateRegisterUsers($this->request->post,1);					
					$json['success'] = $this->language->get('subscribe');				
			}else if(!$this->model_account_newslettersubscribe->checkmailid($this->request->post)){				 
				$this->model_account_newslettersubscribe->subscribe($this->request->post);
				$json['success'] = $this->language->get('subscribe');
				if(isset($setting_info['newslettersubscribe_mail_status']) && $setting_info['newslettersubscribe_mail_status']){				   
					$subject = $this->language->get('mail_subject');						
					$message = '<table width="60%" cellpadding="2"  cellspacing="1" border="0"> 
								 <tr>
								   <td> Email Id </td>
								   <td> '.$this->request->post['subscribe_email'].' </td>
								 </tr>
								 <tr>
								   <td> Name  </td>
								   <td> '.$this->request->post['subscribe_name'].' </td>
								 </tr>';
					if(isset($this->request->post['option1'])) {
					   $message .= '<tr> <td>'.$setting_info['newslettersubscribe_option_field1'].'</td> <td>'.$this->request->post['option1'].'</td> </tr>';  
					}
					if(isset($this->request->post['option2'])) {
					   $message .= '<tr> <td>'.$setting_info['newslettersubscribe_option_field2'].'</td> <td>'.$this->request->post['option2'].'</td> </tr>';  
					}
					if(isset($this->request->post['option3'])) {
					   $message .= '<tr> <td>'.$setting_info['newslettersubscribe_option_field3'].'</td> <td>'.$this->request->post['option3'].'</td> </tr>';  
					}
					if(isset($this->request->post['option4'])) {
					   $message .= '<tr> <td>'.$setting_info['newslettersubscribe_option_field4'].'</td> <td>'.$this->request->post['option4'].'</td> </tr>';  
					}
					if(isset($this->request->post['option5'])) {
					   $message .= '<tr> <td>'.$setting_info['newslettersubscribe_option_field5'].'</td> <td>'.$this->request->post['option5'].'</td> </tr>';  
					}
					if(isset($this->request->post['option6'])) {
					   $message .= '<tr> <td>'.$setting_info['newslettersubscribe_option_field6'].'</td> <td>'.$this->request->post['option6'].'</td> </tr>';  
					} 
					 $message .= '</table>';
		 
					$mail = new Mail();
					$mail->protocol = $this->config->get('config_mail_protocol');
					$mail->parameter = $this->config->get('config_mail_parameter');
					$mail->hostname = $this->config->get('config_smtp_host');
					$mail->username = $this->config->get('config_smtp_username');
					$mail->password = $this->config->get('config_smtp_password');
					$mail->port = $this->config->get('config_smtp_port');
					$mail->timeout = $this->config->get('config_smtp_timeout');				
					$mail->setTo($this->config->get('config_email'));
					$mail->setFrom($this->config->get('config_email'));
					$mail->setSender($this->config->get('config_name'));
					$mail->setSubject($subject);
					$mail->setHtml($message);
					$mail->send();
				}
				 
			}else{
				$json['error'] = $this->language->get('alreadyexist');
			}
			   
		}else{
			$json['error'] = $this->language->get('error_invalid');
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));	
	}

	public function unsubscribe(){
	  if(!isset($this->request->get['module_id']) || !$this->request->get['module_id'])
			return;	
		$this->load->model('extension/module');
		$setting_info = $this->model_extension_module->getModule($this->request->get['module_id']);
	  if(isset($setting_info['newslettersubscribe_thickbox']) && $setting_info['newslettersubscribe_thickbox']){
		  $prefix_eval = "#TB_ajaxContent ";
	  }else{
	      $prefix_eval = "";
	  }
	  
	  $this->language->load('module/newslettersubscribe');
	  
	  $this->load->model('account/newslettersubscribe');
	  $json = array();
	  if(isset($this->request->post['subscribe_email']) && filter_var($this->request->post['subscribe_email'],FILTER_VALIDATE_EMAIL)){            
		    if(isset($setting_info['newslettersubscribe_registered']) && $setting_info['newslettersubscribe_registered'] && $this->model_account_newslettersubscribe->checkRegisteredUser($this->request->post)){			   
			    $this->model_account_newslettersubscribe->UpdateRegisterUsers($this->request->post,0);
				$json['success'] = $this->language->get('unsubscribe');
				
			//echo('$("'.$prefix_eval.' #subscribe_result").html("'.$this->language->get('unsubscribe').'");$("'.$prefix_eval.' #subscribe")[0].reset();');
			   
		    
		   }else if(!$this->model_account_newslettersubscribe->checkmailid($this->request->post)){
			 
		     //echo('$("'.$prefix_eval.' #subscribe_result").html("'.$this->language->get('notexist').'");$("'.$prefix_eval.' #subscribe")[0].reset();');
			 $json['error'] = $this->language->get('notexist');
			 
		   }else{
			   
			  if(isset($setting_info['option_unsubscribe']) && $setting_info['option_unsubscribe']) {
				 $this->model_account_newslettersubscribe->unsubscribe($this->request->post);
				// echo('$("'.$prefix_eval.' #subscribe_result").html("'.$this->language->get('unsubscribe').'");$("'.$prefix_eval.' #subscribe")[0].reset();');
				$json['success'] = $this->language->get('unsubscribe');
			  }
		   }
		   
	  }else{
	    //echo('$("'.$prefix_eval.' #subscribe_result").html("<span class=\"error\">'.$this->language->get('error_invalid').'</span>")');
		 $json['error'] = $this->language->get('error_invalid');
	  }
	  $this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));	
	}
}
?>