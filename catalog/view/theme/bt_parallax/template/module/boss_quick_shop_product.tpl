<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
	<button type="button" class="close" title="<?php echo $text_hover_remove; ?>" data-dismiss="modal" aria-hidden="true">&times;</button>
</div>
<div class="modal-body">
<div id="notification"></div>
<?php global $config; ?>
<?php 
	$pro_des ='use_tab';
	if($config->get('boss_manager')){
		$boss_manager = $config->get('boss_manager'); 
	}else{
		$boss_manager = '';
	}
	if(!empty($boss_manager)){			
		$pro_des = $boss_manager['other']['pro_tab']; 		
	}
?>
<div class="">
<div class="">  
<div id="content">
  <div class="boss-product">
      <div class="row">        
        <div class="col-sm-5">
		  <div class="bt-product-zoom">
          <?php if ($thumb || $images) { ?>
			 <?php if ($thumb) { ?>
           <div class="image"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" id='zoomqs' rel=""><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a>			
			</div>
            <?php } ?>			
         <?php if ($images) { ?>
			<div class="boss-additional">
			<ul class="thumbnails">           
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
				<li class="image-additional"><a class="thumbnail cloud-zoom-gallery" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" rel="useZoom: 'zoomqs', smallImage: '<?php echo $image['popup']; ?>' "> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
		  </div>
			<?php } ?>
			
          <?php } ?>
		  </div>
          
        </div>       
        <div class="col-sm-7">
          <div class="boss-right">
          <h1><?php echo $heading_title; ?></h1>
		  <?php if ($review_status) { ?>
          <div class="rating">
            <p>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
              </p>
           
          </div>
          <?php } ?>
		  <div class="boss-small-detail">
          <ul class="list-unstyled">
            <?php if ($manufacturer) { ?>
            <li><span class="first-text"><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <li><span class="first-text"><?php echo $text_model; ?></span> <?php echo $model; ?></li>
            <?php if ($reward) { ?>
            <li><span class="first-text"><?php echo $text_reward; ?></span> <?php echo $reward; ?></li>
            <?php } ?>
            <li><span class="first-text"><?php echo $text_stock; ?></span><span class="boss-stock"> <?php echo $stock; ?></span></li>
          </ul>
         </div>
          <div id="product">
            <?php if ($options) { ?>
            <hr>
            <h3><?php echo $text_option; ?></h3>
            <?php foreach ($options as $option) { ?>
           <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?> 
			
            <?php if ($option['type'] == 'radio') { ?>
            <div class="boss-radio form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="boss-checkbox form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
			  </div>

            <?php } ?>

            <?php if ($option['type'] == 'image') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
          <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?> 
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
				<div class="boss-small-form-control">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
				</div>
                <div class="boss-calendar"><span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div></div>
            </div>
            <?php } ?> 
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
			  <div class="boss-small-form-control">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
				</div>
				<div class="boss-calendar">
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div></div>
            </div>
            <?php } ?> 
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
			  <div class="boss-small-form-control">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
				</div>
				<div class="boss-calendar">
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id_ps" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>
			<hr style="margin-top:18px;">
            <div class="form-group">
              <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
			  <div class="boss-select-quantity">
			   <button onclick="changeQty(0); return false;" class="decrease">-</button>
              <input type="text" name="quantity-qs" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="select_number form-control" />
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
			  <button onclick="changeQty(1); return false;" class="increase">+</button>
             </div>
			 
            
			   <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
			   <?php if ($price) { ?>
          <div class="boss-price">
		  <div class="main-price">
            <?php if (!$special) { ?>
            
              <span class="price"><?php echo $price; ?></span>
            
            <?php } else { ?>
            <span class="old-price"><?php echo $price; ?></span>
            
              <span class="new-price"><?php echo $special; ?></span>
           
            <?php } ?>
			</div>
            <?php if ($tax) { ?>
            <span><?php echo $text_tax; ?> <?php echo $tax; ?></span>
            <?php } ?>
            <?php if ($points) { ?>
            <span><?php echo $text_points; ?> <?php echo $points; ?></span>
            <?php } ?>
            <?php if ($discounts) { ?>
            <span>
              <hr>
            </span>
            <?php foreach ($discounts as $discount) { ?>
            <span><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></span>
            <?php } ?>
            <?php } ?>
          </div>
          <?php } ?>
		  
              <button type="button" id="button-cart-qs" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-large"><?php echo $button_cart; ?></button>
			   
			  <div class="btn-group">
            <button type="button" data-toggle="tooltip" class="btn-action btn-wishlist" title="<?php echo $button_wishlist; ?>" onclick="boss_addToWishList('<?php echo $product_id; ?>');"><?php echo $button_wishlist; ?></button>
			
            <button type="button" data-toggle="tooltip" class="btn-action btn-compare" title="<?php echo $button_compare; ?>" onclick="boss_addToCompare('<?php echo $product_id; ?>');"><?php echo $button_compare; ?></button>
          </div>
            </div>           
          </div>          		  
        </div>
		</div>
      </div>
	  </div>
	  
</div>
</div>
</div>
<script src="catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/magnific/magnific-popup.css" rel="stylesheet" type="text/css">
<link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="catalog/view/javascript/bossthemes/cloud-zoom/cloud-zoom.1.0.3.js"></script>
<script type="text/javascript"><!--
function changeQty(increase) {
    var qty = parseInt($('.select_number').val());
    if ( !isNaN(qty) ) {
        qty = increase ? qty+1 : (qty > <?php echo $minimum; ?> ? qty-1 : <?php echo $minimum; ?>);
        $('.select_number').val(qty);
    }
}	
$.fn.CloudZoom.defaults = {
	position: 'inside',
	tint: '#ffffff',
	tintOpacity: 0.5,
	lensOpacity: 0.5,
	softFocus: false,
	smoothMove: 3,
	showTitle: false,
	titleOpacity: 0.5,
	adjustX: 0,
	adjustY: 0,
	
};
$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
	
$('.product-info-qs select[name="profile_id"], .product-info-qs input[name="quantity-qs"]').change(function(){
    $.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('.product-info-qs input[name="product_id"], .product-info-qs input[name="quantity-qs"], .product-info-qs select[name="profile_id"]'),
		dataType: 'json',
        beforeSend: function() {
            $('.product-info-qs #profile-description').html('');
        },
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
            
			if (json['success']) {
                $('.product-info-qs #profile-description').html(json['success']);
			}	
		}
	});
});
    

//--></script>	

<script type="text/javascript"><!--
$('select[name=\'recurring_id_ps\'], input[name="quantity-qs"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity-qs\'], select[name=\'recurring_id_ps\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart-qs').on('click', function() { 
	$.ajax({
		url: 'index.php?route=bossthemes/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart-qs').button('loading');
		},
		complete: function() {
			$('#button-cart-qs').button('reset');
		},
		success: function(json) { 
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			
			if (json['success']) { 
				addProductNotice(json['title'], json['thumb'], json['success'], 'success');
				
				$('#cart-total').html(json['total']);
				
				$('#cart > ul').load('index.php?route=common/cart/info ul li');
				$('#myModal').modal('hide');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');
	
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();
					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script> 

</div>
</div>
</div>