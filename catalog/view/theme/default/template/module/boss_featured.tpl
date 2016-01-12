<?php if(!empty($product_data)){ ?>

<?php if($show_slider){ $row = $num_row; $sliderclass = 'slider'; }else {$row = 1; $sliderclass = 'nslider';} ?>
<?php (!empty($product_data['mainproduct']))? $prolarge = 'prolarge': $prolarge = 'nprolarge'; ?>
<?php (!empty($column))?$class_css = '.bt-column':$class_css = 'bt-'.$prolarge.'-'.$sliderclass; ?>
<div class="container">	
<div class="boss-custom-pro <?php echo $class_css; ?>">	

	<div class="title"><h3><?php echo $title; ?></h3></div>
	<div class="box-content bt-product-content">
	<?php if(!empty($product_data['mainproduct'])){ ?>
	<?php $mainproduct = $product_data['mainproduct'];?>
		<div class="bt-product-large">
		<section class="bt-item-large">
		<div class="product-thumb">
			<?php if ($mainproduct['thumb']) { ?>
			<div class="image">
				<a href="<?php echo $mainproduct['href']; ?>">
					<img src="<?php echo $mainproduct['thumb']; ?>" alt="<?php echo $mainproduct['name']; ?>" />
				</a>
			</div>
			<?php } ?>
			
			<div class="name"><a class="boss-name"href="<?php echo $mainproduct['href']; ?>"><?php echo $mainproduct['name']; ?></a></div>
			
			
			<?php if ($mainproduct['price']) { ?>
				<div class="price">
				<?php if (!$mainproduct['special']) { ?>
					<?php echo $mainproduct['price']; ?>
				<?php } else { ?>
					<span class="old-price"><?php echo $mainproduct['price']; ?></span> <span class="new-price"><?php echo $mainproduct['special']; ?></span>
				<?php } ?>
				</div>
			<?php } ?>
			<?php //if ($mainproduct['rating']) { ?>				
				 <div class="rating">
				  <?php for ($i = 1; $i <= 5; $i++) { ?>
				  <?php if ($mainproduct['rating'] < $i) { ?>
				  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
				  <?php } else { ?>
				  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
				  <?php } ?>
				  <?php } ?>
				</div>
				
			<?php //} ?>
			<div class="boss-button">
			<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="boss_addToCart('<?php echo $mainproduct['product_id']; ?>');" class="btn btn-primary" /></div>
				<a class="btn-action btn-wishlist" onclick="boss_addToWishList('<?php echo $mainproduct['product_id']; ?>');"><?php echo $button_wishlist; ?></a>
				<a class="btn-action btn-comapre"onclick="boss_addToCompare('<?php echo $mainproduct['product_id']; ?>');"><?php echo $button_compare; ?></a>
			</div>
			</div>
		</section>
		</div>
	<?php } ?>
	
	<?php if(!empty($product_data['products'])){ ?>
	<?php $products = $product_data['products'];?>
	<div class="bt-items bt-product-grid">
		<div id="boss_featured_<?php echo $module; ?>">
			<?php $i = 0; 
			$count_product = count($products);
			if($count_product<($per_row*$row)){
				$row = 1;
			} ?>
			<?php while($i< $count_product) { ?>		
			
			<?php //if(($i%$row)==0){ ?> <div class="bt-item-extra element-<?php echo $per_row; ?>"> <?php //} ?>
			<?php  $j=0; ?>
			<?php while($i<$count_product && $j < $row){
					$product = $products[$i];
					
					$j++;
					//echo $product['price'];
			?>
			<section class="bt-item">
			<div class="product-thumb">
				<?php if ($product['thumb']) { ?>
				<div class="image">
					<a href="<?php echo $product['href']; ?>">
						<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
					</a>
				</div>
				<?php } ?>
			
				<div class="caption">
					<div class="name">
						<a class="boss-name" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
					</div>
					
					<?php if ($product['price']) { ?>
					<div class="price">
						<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
						<?php } else { ?>
							<span class="old-price"><?php echo $product['price']; ?></span> <span class="new-price"><?php echo $product['special']; ?></span>
						<?php } ?>
					</div>
					<?php } ?>
					<?php if ($product['rating']) { ?>
						
						 <div class="rating">
						  <?php for ($rate = 1; $rate <= 5; $rate++) { ?>
						  <?php if ($product['reviews'] < $rate) { ?>
						  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
						  <?php } else { ?>
						  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
						  <?php } ?>
						  <?php } ?>
						</div>
						
					<?php } ?>
					</div>
					<div class="boss-button">
					<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="boss_addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-primary" /></div>
					
					<div class="btn-action-group">
					<a class="btn-action btn-wishlist" onclick="boss_addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a>
					
					<a class="btn-action btn-comapre"onclick="boss_addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a>
					</div>
				</div>
				</div>
			</section>			
			<?php if(($j==$row)||($i==$count_product)){ ?> </div> <?php } ?>
			<?php } ?>
			
			<?php $border = $i+1; if($border%$per_row==0 && !$show_slider && $border!=$count_product){ ?> <div class="boss_boder"></div><?php } ?>
			
			<?php $i++; } ?>
			
		</div>
		<div class="clearfix"></div>
		<?php if($show_slider){ ?>
			<a id="bt_next_<?php echo $module; ?>" class="btn-nav-center prev nav_thumb" href="javascript:void(0)" title="prev">Prev</a>
			<a id="bt_prev_<?php echo $module; ?>" class="btn-nav-center next nav_thumb" href="javascript:void(0)" title="next">Next</a>
			<?php if($nav_type){ ?>
			<div id="bt_pag_<?php echo $module; ?>" class="bt-pag"></div>
			<?php } ?>
		<?php } ?>
	</div>
	<?php } ?>
  </div>
</div>
<?php if($show_slider){ ?>
<script type="text/javascript"><!--
$(window).load(function(){
	//var image_width = <?php echo $image_width; ?>;
	if ($(window).width() > 768) {
		var image_width = <?php echo $image_width; ?>;
	}else{
		var image_width = 300;
	}
    $('#boss_featured_<?php echo $module; ?>').carouFredSel({
        auto: false,
        responsive: true,
        width: '100%',
		/*height: 'auto',*/
        prev: '#bt_next_<?php echo $module; ?>',
        next: '#bt_prev_<?php echo $module; ?>',
		pagination: '#bt_pag_<?php echo $module; ?>',
        swipe: {
        onTouch : true
        },
        items: {
            width: image_width,
            height: 'auto',
            visible: {
				min: 1,
				max: <?php echo $per_row; ?>
            }
        },
        scroll: {
            direction : 'left',    //  The direction of the transition.
            duration  : 1000   //  The duration of the transition.
        },
		onCreate: function () {
			$(window).smartresize(function(){
				$('#boss_featured_<?php echo $module; ?> section.bt-item').css("height",'');	
				$('#boss_featured_<?php echo $module; ?> section.bt-item').css("height",getMaxHeight('#boss_featured_<?php echo $module; ?> section.bt-item'));	
			});
		}
    });
	
	$('#boss_featured_<?php echo $module; ?> section.bt-item').css("height",getMaxHeight('#boss_featured_<?php echo $module; ?> section.bt-item'));	
	
});
 
function getMaxHeight($elms) {
	var maxHeight = 0;
	$($elms).each(function () {
	
		var height = $(this).outerHeight();
		if (height > maxHeight) {
			maxHeight = height;
		}
	});
	return maxHeight;
};

//--></script>
<?php } ?>
</div>
<?php } ?>

