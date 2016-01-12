<!--module boss - fillter product-->
<?php if(!empty($tabs)){ ?>
<div class="container">
<script type="text/javascript">
$(window).load(function(){
  
	initCarousel(<?php echo $use_tab; ?>,<?php echo $module; ?>,<?php echo $use_scrolling_panel; ?>,<?php echo $prod_item; ?>,<?php echo $image_width; ?>);
});
jQuery(document).ready(function($){	
	<?php if(!$use_tab) { ?>
		checkDevices(<?php echo $module; ?>);
	<?php } ?>

	$("a.head_tabs<?php echo $module;?>").click(function() {
	
		<?php if(!$use_tab) { ?>
			if(getWidthBrowser() > 767){
				return false;
			}
		<?php } ?>
		
		if(!$(this).parent().hasClass('active')) {
		
			$(".head_tabs<?php echo $module;?>").parent().removeClass("active");
			var $src_tab = $(this).attr("data-src");
			$($src_tab).parent().addClass("active");
			$(".content_tabs<?php echo $module;?>").hide();
			var $selected_tab = $(this).attr("href");
			$($selected_tab).fadeIn();
			
			<?php if ($use_scrolling_panel) { ?>
				var $selected_carousel = $(this).attr("data-crs");
				if($selected_carousel != ""){
					execCarousel($selected_carousel,<?php echo $prod_item; ?>,<?php echo $image_width; ?>);
				}
			<?php } ?>
		}
		return false;
	});

	$(window).resize(function() {
		<?php if(!$use_tab) { ?>
			checkDevices(<?php echo $module; ?>);
		<?php } ?>
	});
});
</script>

<div id="boss_homefilter_tabs<?php echo $module; ?>" class="boss_homefilter_tabs">
  
  <div id="tabs_container<?php echo $module; ?>" class="hide-on-mobile tabs_container not-animated" data-animate="fadeInUp" data-delay="300">
  <?php if($use_tab){ ?>
	<ul id="tabs<?php echo $module;?>" class="tabs-headings tabs">
	<?php foreach ($tabs as $numTab => $tab) { ?>
		 <li <?php if($numTab == 0) echo 'class="active"'; ?>><a class="head_tab<?php echo $numTab.$module; ?> head_tabs<?php echo $module;?>" href="#content_tab<?php echo $numTab.$module; ?>" data-src=".head_tab<?php echo $numTab.$module; ?>" data-crs="#carousel_tab<?php echo $numTab.$module; ?>"><?php echo $tab['title']; ?></a></li>
	<?php } ?>
	</ul>
  <?php } ?>
  </div>
  
  <div id="tabs_content_container<?php echo $module; ?>" class="home_filter_content tabs_content_container">
  <div class="box-content not-animated" data-animate="fadeInUp" data-delay="300">
	<?php foreach ($tabs as $numTab => $tab) { ?>
    <h3  class="<?php if($numTab == 0) echo 'active'; ?> <?php if($use_tab){ echo 'hide-on-desktop';} ?>"><a class="head_tab<?php echo $numTab.$module; ?> head_tabs<?php echo $module;?>" href="#content_tab<?php echo $numTab.$module; ?>" data-src=".head_tab<?php echo $numTab.$module; ?>" data-crs="#carousel_tab<?php echo $numTab.$module; ?>"><?php echo $tab['title']; ?></a></h3>
	
    <div id="content_tab<?php echo $numTab.$module; ?>" class="content_tabs<?php echo $module; ?> list_carousel responsive" style="display:<?php if($numTab == 0) echo 'block'; else echo 'none'; ?>">
      <?php if(!empty($tab['products'])){ ?>
		<?php
		if($prod_item == 5){
			$boss_class= 'boss-col-5column col-sm-3 col-xs-12';
		}else{
			$cols = 12/$prod_item;
			$boss_class = 'col-lg-'.$cols.' col-md-'.$cols.' col-sm-'.$cols.' col-xs-12';
		}
		 ?>
		<ul id="carousel_tab<?php echo $numTab.$module; ?>" data-prev="#prev_tab<?php echo $numTab.$module; ?>" data-next="#next_tab<?php echo $numTab.$module; ?>" class="box-product">
			<?php foreach ($tab['products'] as $key => $product){?><li <?php echo ($use_scrolling_panel)?'':'class="'.$boss_class.'"'; ?>>
			<div class="product-thumb">
			<?php if ($product['thumb']) { ?>
				<div class="image">
				<a data-id="<?php echo $product['product_id']; ?>"  href="<?php echo $product['href']; ?>">
					<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/>
					
					
					
				</a>
				</div>
				<?php } ?>
				<div>
				<div class="caption">
				
				<div class="name"><a class="boss-name" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
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
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
				</div>
				
				
				
				<div class="cart"><a class="btn btn-primary" title="<?php echo $button_cart; ?>" onclick="boss_addToCart('<?php echo  $product['product_id'];  ?>');"><span><?php echo $button_cart; ?></span></a></div>
				<div class="btn-action-group">
				<a class="btn-action btn-wishlist" title="<?php echo $button_wishlist; ?>" onclick="boss_addToWishList('<?php echo  $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></a>
				<a class="btn-action btn-comapre" title="<?php echo $button_compare; ?>" onclick="boss_addToCompare('<?php echo  $product['product_id'];  ?>');"><span><?php echo $button_compare; ?></span></a>
				</div>
				</div>
				
			</div>
			  </li><?php } ?></ul>
		<div class="clearfix"></div>
		<?php if ($use_scrolling_panel) { ?>
			<a id="prev_tab<?php echo $numTab.$module; ?>" class="btn-nav-center prev nav_thumb" href="javascript:void(0)"><i class="fa fa-angle-left"></i></a>
			<a id="next_tab<?php echo $numTab.$module; ?>" class="btn-nav-center next nav_thumb" href="javascript:void(0)"><i class="fa fa-angle-right"></i></a>
		<?php } ?>
		<?php } ?>
    </div>
	<?php } ?>
  </div>
  </div>
</div>
</div>
<?php } ?>
<!--module boss - fillter product-->