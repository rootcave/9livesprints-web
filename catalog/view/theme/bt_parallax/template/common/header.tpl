<?php
$user_agent = getenv("HTTP_USER_AGENT");
if(strpos($user_agent, "Win") !== FALSE){
	$os = "Windows";
}elseif(strpos($user_agent, "Mac") !== FALSE){
	$os = "Mac";
}else{
	$os = "other";
}
?>
<?php global $config; //global $loader; ?>
<?php 
	$b_style = '';$h_style = ''; $status=0; $show_menu = 'default'; 
	if($config->get('boss_manager')){
		$boss_manager = $config->get('boss_manager'); 
	}else{
		$boss_manager = '';
	}
	if(!empty($boss_manager)){
		$layout = isset($boss_manager['layout'])?$boss_manager['layout']:''; 
		$status = isset($boss_manager['status'])?$boss_manager['status']:0; 
		$option = isset($boss_manager['option'])?$boss_manager['option']:''; 
		$other = isset($boss_manager['other'])?$boss_manager['other']:''; 
		$header_link = isset($boss_manager['header_link'])?$boss_manager['header_link']:''; 
	}
	if(isset($layout['mode_css']) && $layout['mode_css'] =='wide'){
		$mode_css = 'bt-wide';
	}else{
		$mode_css = 'bt-boxed';
		$b_style = (!empty($layout['box_width']))?'style="max-width:'.$layout['box_width'].'px"':'';
	}
	if(isset($layout['h_mode_css']) && $layout['h_mode_css'] =='boxed'){
		$h_mode_css = 'bt-hboxed';
		$h_style = (!empty($layout['h_box_width']))?'style="max-width:'.$layout['h_box_width'].'px"':'';
	}else{
		$h_mode_css = '';
	}
	if(isset($other['stylesheet']) && $other['stylesheet']){
		$stylesheet = $other['stylesheet'];
	}else{
		$stylesheet=1;
	}
	if(isset($option['loading'])){
		$loading = $option['loading'];
	}else{
		$loading=1;
	}
	
?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bossthemes/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bossthemes/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bossthemes/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/stylesheet<?php echo $stylesheet;?>.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/bossthemes/bt_stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/bossthemes/responsive.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/bossthemes/bootstrap-select.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/bossthemes/jquery.jgrowl.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/bossthemes/jquery-ui-1.11.2/jquery-ui.css" />
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<script type="text/javascript" src="catalog/view/javascript/bossthemes/getwidthbrowser.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.appear.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/cs.bossthemes.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.jgrowl.js"></script>
<?php if ($os != 'Mac') { ?>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/jquery.smoothscroll.js"></script>
<?php }?>
<script type="text/javascript" src="catalog/view/javascript/bossthemes/bootstrap-select.js"></script>
<?php if (isset($option['animation']) && $option['animation']) {  ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/bossthemes/cs.animate.css" />
<?php } ?>
<link href='https://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
<?php
if($status){
	include "catalog/view/theme/".$config->get('config_template')."/template/bossthemes/boss_color_font_setting.php";
} ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>

<?php 	
	if (isset($option['sticky_menu']) && $option['sticky_menu']) { ?>
	
	<script type="text/javascript"><!--
	$(window).scroll(function() {
			var height_header = $('#bt_header').height();  			
			if($(window).scrollTop() > height_header) {
				
				$('.header-bottom').addClass('boss_scroll');
			} else {
				$('.header-bottom').removeClass('boss_scroll');
			}
		});
	//--></script>
	<!--[if IE 8]> 
	<script type="text/javascript">
	$(window).scroll(function() {
			var height_header = $('#bt_header').height();  			
			if($('html').scrollTop() > height_header) {				
				$('.header-bottom').addClass('boss_scroll');
			} else {
				$('.header-bottom').removeClass('boss_scroll');
			}
		});
	</script>
	<![endif]-->
<?php } ?>
<?php echo $google_analytics; ?>
<?php if(isset($this->request->get['route'])){$route1 = $this->request->get['route'];}else{$route1 ="";}
	if(isset($route1) && ($route1== "common/home" || $route1=="") && $loading){ ?>
		<script type="text/javascript"><!--
			window.onload = function() {
				$(".bt-loading").fadeOut("1500", function () {
					$('#bt_loading').css("display", "none");
				});
				
			};


		//--></script>
	<?php }else{ ?>
		<script type="text/javascript"><!--
		$(document).ready(function() {
			$('#bt_loading').css("display", "none");
		});
		//--></script>
	<?php } ?>

<style>
	#bt_loading{position:fixed; width:100%; height:100%; z-index:99999; background:none repeat scroll 0 0 #fff;}
	.bt-loading{
		height: 300px;
		left: 50%;
		margin-left: -200px;
		margin-top: -150px;
		position: absolute;
		top: 50%;
		width: 400px;
		z-index: 9999;
	}
</style>
<?php if($direction=='rtl'){ ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $config->get('config_template'); ?>/stylesheet/bossthemes/stylertl.css" />
<?php } ?>


</head>

<body class="<?php echo $class; ?> <?php if($direction=='rtl') echo 'rtl';?>">
<div id="bt_loading"><div class="bt-loading"><img alt="loading" src="image/catalog/<?php echo $config->get('config_template'); ?>/loading.gif" /></div></div>
<div id="bt_container" class="<?php  echo $mode_css;?>" <?php echo $b_style;?>>
<div class="<?php if(isset($other['class_home']) && $other['class_home']) echo $other['class_home']; ?>">
<div id="bt_header" class="<?php echo $h_mode_css;?>" <?php echo $h_style;?>>
<?php 
require_once( DIR_TEMPLATE.$config->get('config_template')."/template/bossthemes/boss_library.php" );
$helper = ThemeControlHelper::getInstance( $this->registry,$config->get('config_template'));
?>
<header class="" style="border-bottom:0px solid #000;position:fixed;width:100%;z-index:999;">
<div class="header-top">
<div class="container">
<div class="row">
<div class="left col-lg-2 col-md-4 col-sm-4 col-xs-12">
		<?php if(isset($header_link['logo']) && $header_link['logo']){ ?>
		<div id="logo">
		  <?php if ($logo) { ?>
		  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
		  <?php } else { ?>
		  <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
		  <?php } ?>
		</div>
		<?php } ?>
</div>

<div class="left col-lg-6 col-md-4 col-sm-4 col-xs-12" style="font-size: 17px; text-align:center;padding-top:20px;color:#fff"></div>
	<div class="right col-lg-4 col-md-8 col-sm-8 col-xs-12">
		<div id="top-links" class="nav pull-right">
		  <ul class="list-inline">
			<?php if(isset($header_link['phone']) && $header_link['phone']){ ?>	<li class="contact"><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li> <?php } ?>
			<?php if (isset($welcome_message)) { echo $welcome_message; } ?><br>

			

			<?php if(isset($header_link['my_account']) && $header_link['my_account']){ ?> <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span style="color:#fff;"><?php echo $text_account; ?></span> <span class="caret"></span></a>
			  <ul class="dropdown-menu dropdown-menu-right">
				<?php if ($logged) { ?>
				<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
			
				<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
				<?php } else { ?>
				<li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
				<li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
				<?php } ?>
			  </ul>
			</li><?php } ?>
			
			
			<?php if(isset($header_link['shopping_cart']) && $header_link['shopping_cart']){ ?><li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="" style="color:#fff;"><?php echo $text_shopping_cart; ?></span></a></li><?php } ?>
			<?php if(isset($header_link['checkout']) && $header_link['checkout']){ ?><li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="" style="color:#fff;"><?php echo $text_checkout; ?></span></a></li><?php } ?>
		  </ul>
		</div>		
		<?php if(isset($header_link['search']) && $header_link['search']){ ?>
		<div class="boss-search">
			<?php echo $search; ?>
		</div>
		<?php } ?>
					
		<?php if(isset($header_link['cart_mini']) && $header_link['cart_mini']){ echo $cart;} ?>
		<?php if(isset($header_link['currency']) && $header_link['currency']){ echo $currency;} ?>
		<?php if(isset($header_link['language']) && $header_link['language']){ echo $language;} ?>









	</div>
	</div>
	</div>
</div>
<div class="container">
	<?php echo isset($btheader)?$btheader:''; ?>
</div>
<div class="" style="background:#fff;border-bottom: 1px solid #e5e5e5 !important;">
<div class="container">
<div id="bt_mainmenu">
<div class="row">


	<div class="left col-lg-12 col-md-9 col-sm-9 col-xs-12 boss-left">
	<?php 	
		if(isset($option['use_menu']) && $option['use_menu'] == 'megamenu'){
			$modules =$helper->getModulesByPosition('mainmenu'); 
			if( $modules ){
				foreach ($modules as $module) { 
					 echo $module; 
				} 
			} 		
		}else{
	?>
	<?php if ($categories) { ?>
	
	  <nav id="menu" class="navbar">
		<div class="navbar-header">
		  <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
		  <span id="category" class="visible-xs"><?php echo $text_category; ?></span>
		</div>
		<div class="collapse navbar-collapse navbar-ex1-collapse">
		  <ul class="nav navbar-nav">
			<?php foreach ($categories as $category) { ?>
			<?php if ($category['children']) { ?>
			<li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
			  <div class="dropdown-menu">
				<div class="dropdown-inner">
				  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
				  <ul class="list-unstyled">
					<?php foreach ($children as $child) { ?>
					<li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
					<?php } ?>
				  </ul>
				  <?php } ?>
				</div>
				<a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
			</li>
			<?php } else { ?>
			<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
			<?php } ?>
			<?php } ?>
		  </ul>
		</div>
	  </nav>
	
	<?php } } ?>
	</div>
	</div>
	</div><!-- End bt_mainmenu -->
	
	</div> 
	<div align="center" style="border-top: 1px solid #e5e5e5 !important;display:none;"><div style="border-radius:0px 0px 4px 4px;width:250px;border:0px solid #000;height:45px;background: rgba(0, 0, 0, 0) linear-gradient(to bottom, #7ec644, #50b200) repeat scroll 0 0 !important;color:#fff;text-align:center;padding-top:10px;font-weight:bold;font-size:16px">Creat Your Own Now</div></div>
</div>

</header>

</div> <!-- End #bt_header -->
<?php echo isset($slideshow)?$slideshow:''; ?>
</div>
