<?php 
$product = $GLOBALS['product'];
$settings = $GLOBALS['settings'];
$addons = $GLOBALS['addons'];
?>

<style>

.form-control
{
/*width:86% !important;*/
border:1px solid #f37221 !important;
margin:0 auto;
}

#product-attributes .list-number
{
padding:10px;
}
</style>
<div class="col-right">
	<span class="arrow-mobile" data="right"><i class="glyphicons chevron-left"></i></span>
	<div id="dg-right">
		<!-- product -->
		<div class="align-center" id="right-options">
			<div class="dg-box">
				<div class="accordion">
					<h3><?php echo lang('designer_right_product_options'); ?></h3>
					<div class="product-options contentHolder" id="product-details">
					<?php if ($product != false) { ?>
						<div class="content-y">									
							<?php if (isset($product->design) && $product->design != false) { ?>
							<div class="product-info">
								<div class="form-group product-fields">
									<label for="fields"><?php echo lang('designer_right_choose_product_color'); ?></label>
									<div class="list-colors" id="product-list-colors">
										<?php for ($i=0; $i<count($product->design->color_hex); $i++) { ?>
										<span class="bg-colors dg-tooltip <?php if ($i==0) echo 'active'; ?>" onclick="design.products.changeColor(this, <?php echo $i; ?>)" data-color="<?php echo $product->design->color_hex[$i]; ?>" style="background-color:#<?php echo $product->design->color_hex[$i]; ?>" data-placement="top" data-original-title="<?php echo $product->design->color_title[$i]; ?>"></span>
										<?php } ?>
									</div>
								</div>
								<?php $addons->view('product'); ?>
							</div>
							<?php } ?>
							<!--<form method="POST" id="tool_cart" name="tool_cart" action="">							
							<div class="product-info" id="product-attributes">
								<?php if (isset($product->attribute)) { ?>
									<?php echo $product->attribute; ?>
								<?php } ?>
								<?php $addons->view('attribute'); ?>
							</div>
							</form>	-->
						</div>
					<?php } ?>
					</div>
					
					<h3><?php echo lang('designer_right_color_used'); ?></h3>
					<div class="color-used"></div>
					
					<h3><?php echo lang('designer_right_screen_size'); ?></h3>
					<div class="screen-size"></div>					
				</div>


				<form method="POST" id="tool_cart" name="tool_cart" action="">							
							<div class="product-info" id="product-attributes">
								<?php if (isset($product->attribute)) { ?>
									<?php echo $product->attribute; ?>
								<?php } ?>
								<?php $addons->view('attribute'); ?>
							</div>
							</form>	

				<div class="product-prices">
					<div id="product-price" <?php echo cssShow($settings, 'show_price', 1); ?>>
						<span class="product-price-title"><?php echo lang('designer_right_total'); ?></span>
						<div class="product-price-list">
							<span id="product-price-old">
								<?php echo $settings->currency_symbol; ?><span class="price-old-number">123</span>
							</span>
							<span id="product-price-sale">
								<?php echo $settings->currency_symbol; ?><span class="price-sale-number">100</span>
							</span>
						</div>
						<span class="price-restart" title="Click to get price" onclick="design.ajax.getPrice()"><i class="glyphicons restart"></i></span>
					</div>

					


					<?php $addons->view('cart'); ?>
					<button <?php echo cssShow($settings, 'show_add_to_cart', 1); ?> type="button" class="btn btn-warning btn-addcart" onclick="design.ajax.addJs(this)"><i class="glyphicons shopping_cart"></i><?php echo lang('designer_right_buy_now'); ?></button>								
				</div>
			</div>
		</div>
	</div>
</div>