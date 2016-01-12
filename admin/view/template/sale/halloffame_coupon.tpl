<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> Hall of Fame Discount Eligible Customer List</h3>
      </div>
      <div class="panel-body">
        
        
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>                  
                  <td class="text-left">Customer Details</td>
                  <td class="text-left">Put Coupon Code</td>
                  <td class="text-center">Action</td>
                  <td class="text-center">Delete</td>                  
                </tr>
              </thead>
              <tbody>
                <?php if (!empty($coupon)) { ?>
                <?php 
					$counter=1; 
					foreach ($coupon as $key_coupon) { 
					
					$reg_customer = new ModelSaleHalloffameCoupon($this->registry);
					$chk_last_order = $reg_customer->getCustomer($key_coupon['customer_id']);

					

				?>
                <tr>                  
                  <td class="text-left"><?php echo $chk_last_order['customer_name']; ?><br /><br /><em>Email: <?php echo $chk_last_order['email']; ?><br />Phone: <?php echo $chk_last_order['telephone']; ?></em></td>
                  <td class="text-left"><?php if( $key_coupon['status']=='n' ){ ?><input type="text" value="" name="txt_coupon_<?php echo $counter; ?>"  id="txt_coupon_<?php echo $counter; ?>" placeholder="Enter Coupon Code" /><?php }else{ echo 'Coupon code sent'; } ?></td>
                  
				  <td class="text-center"><?php if( $key_coupon['status']=='n' ){ ?><button onclick="sendCoupon('<?php echo $key_coupon['id']; ?>','<?php echo $counter; ?>');" class="btn btn-primary" id="button-send"><i class="fa circle"></i> Send Coupon</button><?php } ?>&nbsp;<img src="../image/trance.png" id="loader_img<?php echo $counter; ?>"></td>
                 
				  <td class="text-center"><?php if( $key_coupon['status']=='y' ){ ?>
					<button onclick="confirmdelete('<?php echo $key_coupon['id']; ?>','<?php echo $counter; ?>');" class="btn btn-danger" title="" type="button" data-original-title="Delete"><i class="fa fa-trash-o"></i></button>
					<?php } ?>
				  </td>  
				  
                </tr>
                <?php $counter++; } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="4">No record!!</td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        

        
      </div>
    </div>
  </div>
<script type="text/javascript"><!--
function sendCoupon(cc_id,counter_val){
	//alert(cc_id+' === '+counter_val);
	if($.trim($('#txt_coupon_'+counter_val).val()) == ''){
		alert('Please enter coupon code.');
		$('#txt_coupon_'+counter_val).focus();
	}else{
		var ccCode = $('#txt_coupon_'+counter_val).val();
		var url = "../9livesprints_functions/admin_send_coupon.php?req="+cc_id+"&cd="+ccCode; // the script where you handle the form input.
		$("#loader_img"+counter_val).attr('src' ,'../image/loader.gif');
		$.ajax({
			   type: "GET",
			   url: url,			  
			   success: function(data){
				   if(data == "request-confirm"){					 
						location.reload();
				   }else{
						$("#loader_img"+counter_val).attr('src' ,'../image/trance.png');
						alert(data);
				   }
			   }
		});			
	}
}

function confirmdelete(cc_id,counter_val){
	if(confirm('Are you sure? You want to delete this record.')){
		var url = "../9livesprints_functions/admin_remove_coupon.php?cid="+cc_id; // the script where you handle the form input.
		$("#loader_img"+counter_val).attr('src' ,'../image/loader.gif');
		$.ajax({
			   type: "GET",
			   url: url,			  
			   success: function(data){
				   if(data == "request-confirm"){					 
						location.reload();
				   }else{
						$("#loader_img"+counter_val).attr('src' ,'../image/trance.png');
						alert(data);
				   }
			   }
		});	
	}
}

//--></script> 
</div>
<?php echo $footer; ?>