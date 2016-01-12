<div class="bt-newletter">
<div class="container">
<div class="row">

<div class="col-xs-12 col-sm-12 col-md-12 not-animated" data-animate="fadeInUp" data-delay="600">
<div class="newletter">
	<h1 class="title"><span><?php echo $title; ?></span></h1>
	<div>
	<p class="text-title"><?php echo $text_sub_title; ?>
	
	<div class="newletter-content">
		<div id="frm_subscribe">
			<form name="subscribe" id="subscribe<?php echo $module_id; ?>">
				<table>
				   <tr>
					 <td><input class="form-control" size="50" class="input-new" type="text" placeholder="<?php echo $text_email; ?>" name="subscribe_email" id="subscribe_email"> <a class="btn btn-primary" onclick="email_subscribe(<?php echo $module_id; ?>)"><?php echo $entry_button; ?></a>
					 <?php if($option_unsubscribe) { ?>
					  <a class="btn btn-default" onclick="email_unsubscribe(<?php echo $module_id; ?>)"><?php echo $entry_unbutton; ?></a>
					  <?php } ?>
					 </td>
					</tr>
					<tr style="display:none;">
					 <td><input class="form-control" size="50" class="input-new" type="text" value="<?php echo $text_email; ?>" name="subscribe_name" id="subscribe_name"></td>
					</tr>
					<tr>		
					 <td id="subscribe_result<?php echo $module_id; ?>"></td>
				   </tr>
				   <?php for($ns=1;$ns<=$option_fields;$ns++) {
					$ns_var= "option_fields".$ns; ?>
					<tr class="option">
						<td><?php if($$ns_var!=""){
						 echo($$ns_var."&nbsp;<br/>");
						 echo('<input type="text" class="form-control" value="" name="option'.$ns.'" id="option'.$ns.'">');
						} ?></td>
				   </tr>
					<?php } ?>					  
				</table>
			</form>
		</div>
	</div>
	</div>
<script type="text/javascript"><!--

function email_subscribe(module_id){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/subscribe&module_id='+module_id,
			dataType: 'json',
            data:$("#subscribe"+module_id).serialize(),
			beforeSend: function() {
			$('.success, .warning').remove();
				$('#subscribe'+module_id)[0].reset();			
			},		
			success: function(json) {
				if (json['error']) {
					$('#subscribe_result'+module_id).html('<span class="error">' + json['error'] + '</span>');
				}
				
				if (json['success']) {
					$('#subscribe_result'+module_id).html('<span class="success">' + json['success'] + '</span>');
					
				}
			}			
	}); 
}
function email_unsubscribe(module_id){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/unsubscribe&module_id='+module_id,
			dataType: 'json',
            data:$("#subscribe"+module_id).serialize(),
			beforeSend: function() {
			$('.success, .warning').remove();
				$('#subscribe'+module_id)[0].reset();			
			},		
			success: function(json) {
				if (json['error']) {
					$('#subscribe_result'+module_id).html('<span class="error">' + json['error'] + '</span>');
				}
				
				if (json['success']) {
					$('#subscribe_result'+module_id).html('<span class="success">' + json['success'] + '</span>');
					
				}
			}	
	}); 
}
//--></script>
</div>
</div>
</div>
</div>
</div>
