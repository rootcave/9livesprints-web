<?php echo $header; ?>
<div class="">
	<div class="container">
		<?php echo $content; ?>
	</div>
</div>
<link href="<?php echo $url . 'tshirtecommerce/assets/css/mobile.css'; ?>" rel="stylesheet">
<script type="text/javascript">
	var urlBack = '<?php echo $url .'index.php?route=product/product&product_id='.$parent_id ; ?>';	
	var urlDesign = '<?php echo $url .'index.php?route=tshirtecommerce/designer'; ?>';
	var urlDesignload = '<?php echo $urlDesignload; ?>';
</script>
<script src="<?php echo $url . 'tshirtecommerce/assets/js/app.js'; ?>" type="text/javascript"></script>
<?php echo $footer; ?>