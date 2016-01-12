<?php global $config;?>
<?php 
	$boss_scroll = 0; $f_mode_css =''; $f_style = '';
	if($config->get('boss_manager')){
		$boss_manager = $config->get('boss_manager'); 
	}else{
		$boss_manager = '';
	}
	if(!empty($boss_manager)){		
		$option = isset($boss_manager['option'])?$boss_manager['option']:''; 
		$layout = isset($boss_manager['layout'])?$boss_manager['layout']:''; 
		$footer_link = isset($boss_manager['footer_link'])?$boss_manager['footer_link']:''; 
	}
	
	if(isset($layout['f_mode_css']) && $layout['f_mode_css'] =='fboxed'){
		$f_mode_css = 'bt-fboxed';
		$f_style = (!empty($layout['f_box_width']))?'style="max-width:'.$layout['f_box_width'].'px"':'';
	}else{
		$f_mode_css = '';
	}
	
?>
<?php $footer_shipping = $config->get('boss_manager_footer_shipping'); ?>
<?php $footer_about = $config->get('boss_manager_footer_about'); ?>
<?php $footer_social = $config->get('boss_manager_footer_social'); ?>
<?php $footer_payment = $config->get('boss_manager_footer_payment'); ?>
<?php $footer_powered = $config->get('boss_manager_footer_powered'); ?>
<?php $footer_contact = $config->get('boss_manager_footer_contact'); ?>
<?php 
require_once( DIR_TEMPLATE.$config->get('config_template')."/template/bossthemes/boss_library.php" );
$helper = ThemeControlHelper::getInstance( $this->registry,$config->get('config_template'));
?>
<footer id="bt_footer" class="<?php echo $f_mode_css;?>" <?php echo $f_style;?>>
	
	<div class="boss_footer">	
	<?php 
		$modules =$helper->getModulesByPosition('boss_footer'); 
			if( $modules ){
				foreach ($modules as $module) { 
					 echo $module; 
				} 
			}
			
		if(isset($footer_shipping['status']) && $footer_shipping['status']) {?>
			<h3><?php echo html_entity_decode(isset($footer_shipping['contact_title'][$config->get('config_language_id')])?$footer_shipping['contact_title'][$config->get('config_language_id')]:'',ENT_QUOTES, 'UTF-8'); ?></h3>
			<?php echo html_entity_decode(isset($footer_shipping['contact_content'][$config->get('config_language_id')])?$footer_shipping['contact_content'][$config->get('config_language_id')]:'',ENT_QUOTES, 'UTF-8'); ?>
	<?php } ?>	
	</div>
  <div class="container">
 <div class="footer_column">
 
 <div>
    <div class="row">
  <?php if((isset($footer_link['information']) && $footer_link['information']) || (isset($footer_link['contact_us']) && $footer_link['contact_us']) || (isset($footer_link['return']) && $footer_link['return']) || (isset($footer_link['site_map']) && $footer_link['site_map'])) { ?>
  <div class="column col-lg-3 col-md-3 col-sm-6 col-xs-12 not-animated" data-animate="fadeInUp" data-delay="200">
    <h3><?php echo $text_information; ?></h3>
    <ul>
	  <?php if(isset($footer_link['information']) && $footer_link['information']){ ?>
	  <?php if ($informations) { ?>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
	  <?php } ?>
	  <?php } ?>
	  <?php if(isset($footer_link['contact_us']) && $footer_link['contact_us']){ ?>
	  <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
	  <?php } ?>
	  <?php if(isset($footer_link['return']) && $footer_link['return']){ ?>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
	  <?php } ?>
	  <?php if(isset($footer_link['site_map']) && $footer_link['site_map']){ ?>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
	  <?php } ?>
    </ul>
  </div>
  <?php } ?>
  <?php if((isset($footer_link['my_account']) && $footer_link['my_account']) || (isset($footer_link['order_history']) && $footer_link['order_history']) || (isset($footer_link['newsletter']) && $footer_link['newsletter']) || (isset($footer_link['brands']) && $footer_link['brands']) || (isset($footer_link['gift_vouchers']) && $footer_link['gift_vouchers']) || (isset($footer_link['affiliates']) && $footer_link['affiliates']) || (isset($footer_link['specials']) && $footer_link['specials']) || (isset($footer_link['wishlist']) && $footer_link['wishlist'])) { ?>
  <div class="column col-lg-3 col-md-3 col-sm-6 col-xs-12 not-animated" data-animate="fadeInUp" data-delay="400">
    <h3><?php echo $text_account; ?></h3>
    <ul>
	 <?php if(isset($footer_link['my_account']) && $footer_link['my_account']){ ?>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
	  <?php } if(isset($footer_link['order_history']) && $footer_link['order_history']){ ?>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
	  <?php } if(isset($footer_link['newsletter']) && $footer_link['newsletter']){ ?>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
	  <?php } if(isset($footer_link['brands']) && $footer_link['brands']){ ?>
	  <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
	  <?php } if(isset($footer_link['gift_vouchers']) && $footer_link['gift_vouchers']){ ?>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
	  <?php } if(isset($footer_link['affiliates']) && $footer_link['affiliates']){ ?>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
	  <?php } if(isset($footer_link['specials']) && $footer_link['specials']){ ?>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
	  <?php } if(isset($footer_link['wishlist']) && $footer_link['wishlist']){  ?>
	  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
	  <?php } ?>
    </ul>
  </div>
  <?php } ?>
	<?php if(isset($footer_about['status']) && $footer_about['status']){ ?> 
	<div class="footer-about column col-lg-3 col-md-3 col-sm-6 col-xs-12 not-animated" data-animate="fadeInUp" data-delay="600">
		<h3><?php echo html_entity_decode($footer_about['about_title'][$config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?></h3>
		<?php if($footer_about['image_status']){ ?><a href="#" title="parallax"><img alt="parallax" src="image/<?php echo $footer_about['image_link']; ?>"></a> <?php } ?>
		<?php echo html_entity_decode($footer_about['about_content'][$config->get('config_language_id')],ENT_QUOTES, 'UTF-8'); ?>
	</div>
	<?php } ?>
  
	<div class="block-footer-top column col-lg-3 col-md-3 col-sm-6 col-xs-12 not-animated" data-animate="fadeInUp" data-delay="800">
		<?php if(isset($footer_contact['status']) && $footer_contact['status']){ ?> 
		<div class="footer-contact">
			<h3><?php echo html_entity_decode(isset($footer_contact['contact_title'][$config->get('config_language_id')])?$footer_contact['contact_title'][$config->get('config_language_id')]:'',ENT_QUOTES, 'UTF-8'); ?></h3>
			<?php echo html_entity_decode(isset($footer_contact['contact_content'][$config->get('config_language_id')])?$footer_contact['contact_content'][$config->get('config_language_id')]:'',ENT_QUOTES, 'UTF-8'); ?>
		</div>
		<?php } ?>
		
		<?php if(isset($footer_social['status']) && $footer_social['status']){ ?>
		<div class="footer-social">
		<h3><?php echo html_entity_decode(isset($footer_social['title'][$config->get('config_language_id')])?$footer_social['title'][$config->get('config_language_id')]:'',ENT_QUOTES, 'UTF-8'); ?></h3>

		<ul>
			<li><a href="<?php echo isset($footer_social['face_url'])?$footer_social['face_url']:'#'; ?>" title="Facebook"><i class="fa fa-facebook"></i></a></li>
			<li><a href="<?php echo isset($footer_social['twitter_url'])?$footer_social['twitter_url']:'#'; ?>" title="Twiter"><i class="fa fa-twitter"></i></a></li>
			<li><a href="<?php echo isset($footer_social['pinterest_url'])?$footer_social['pinterest_url']:'#'; ?>" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
			<li><a href="<?php echo isset($footer_social['rss_url'])?$footer_social['rss_url']:'#'; ?>" title="RSS"><i class="fa fa-instagram"></i></a></li>
		</ul>
		</div>
		<?php } ?>
	</div>
	</div>
	</div>
	</div>
	</div>
	<div class="container">
		<?php echo isset($btfooter)?$btfooter:''; ?>
	</div>
	<div class="container">
	<div class="powered-payment">
	
	<div class="row">
		<div class="powered col-lg-6 col-md-6 col-sm-6 col-xs-12 not-animated" data-animate="fadeInUp" data-delay="200">
		
			<?php echo html_entity_decode(isset($footer_powered[$config->get('config_language_id')])?$footer_powered[$config->get('config_language_id')]:'',ENT_QUOTES, 'UTF-8'); ?>
		</div>

		<?php if(isset($footer_payment['status']) && $footer_payment['status']){ ?>
		<div class="payment col-lg-6 col-md-6 col-sm-6 col-xs-12 not-animated" data-animate="fadeInUp" data-delay="400">
		<ul>
			<?php if(isset($footer_payment['visa_status'])&&$footer_payment['visa_status']){ ?>
				<li><a title="Visa" href="<?php echo isset($footer_payment['visa_link'])?$footer_payment['visa_link']:'#'; ?>" class="visa"><img alt="Visa" src="image/catalog/bt_parallax/visa.png"></a></li>
			<?php } ?>
			<?php if(isset($footer_payment['master_status'])&&$footer_payment['master_status']){ ?>
				<li><a title="MasterCard" href="<?php echo isset($footer_payment['master_link'])?$footer_payment['master_link']:'#'; ?>" class="masterCard"><img alt="MasterCard" src="image/catalog/bt_parallax/master.png" /></a></li>
			<?php } ?>
			<?php if(isset($footer_payment['merican_status'])&&$footer_payment['merican_status']){ ?>
				<li><a title="Merican" href="<?php echo isset($footer_payment['merican_link'])?$footer_payment['merican_link']:'#'; ?>" class="merican"><img alt="Merican" src="image/catalog/bt_parallax/american.png" /></a></li>
			<?php } ?>
			<?php if(isset($footer_payment['paypal_status'])&&$footer_payment['paypal_status']){ ?>
				<li><a title="Paypal" href="<?php echo isset($footer_payment['paypal_link'])?$footer_payment['paypal_link']:'#'; ?>" class="paypal"><img alt="Paypal" src="image/catalog/bt_parallax/paypal.png"></a></li>
			<?php } ?>
			<?php if(isset($footer_payment['skrill_status'])&&$footer_payment['skrill_status']){ ?>
				<li><a title="Skrill" href="<?php echo isset($footer_payment['skrill_link'])?$footer_payment['skrill_link']:'#'; ?>" class="skrill"><img alt="Skrill" src="image/catalog/bt_parallax/skrill.png"></a></li>
			<?php } ?>
		</ul>
		</div>
		<?php } ?>
		</div>
		</div>
	</div>
</footer>
<?php
if(isset($option['bt_scroll_top']) && $option['bt_scroll_top']){ ?>
<div id="back_top" class="back_top" title="Back To Top"><span><i class="fa fa-angle-up"></i></span></div>
<?php } ?>
 <script type="text/javascript">
        $(function(){
			$(window).scroll(function(){
				if($(this).scrollTop()>600){
				  $('#back_top').fadeIn();
				}
				else{
				  $('#back_top').fadeOut();
				}
			});
			$("#back_top").click(function (e) {
				e.preventDefault();
				$('body,html').animate({scrollTop:0},800,'swing');
			});
        });
</script> 
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->
</div> <!-- End #bt_container -->

<?php if(strstr($_SERVER['REQUEST_URI'],'tshirtecommerce')){ ?>

<script type="text/javascript">
window.onbeforeunload = function (example) {
   example = example || window.event;
   // For IE and Firefox prior to version 4
   if (example) {
      example.returnValue = 'Are you sure you want to close the Tab?';
   }
   // For Safari
   return 'Are you sure you want to close the Tab?';
};

//--></script>

<?php } ?>

</body></html>