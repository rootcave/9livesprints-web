<div id="cart">
  <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="btn-dropdown-cart dropdown-toggle"><i class="fa fa-shopping-cart"></i> <span id="cart-total"><?php echo $text_items; ?></span></button>
  <ul class="dropdown-menu pull-right">
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?>
			<div class="boss-remove"><button type="button" onclick="cart.remove('<?php echo $product['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn-remove"><i class="fa fa-times"></i></button></div>
			</td>
			
          <td class="text-left">
			  <a class="boss-name" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
				<?php if ($product['option']) { ?>
				<?php foreach ($product['option'] as $option) { ?>
				<br />
				- <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
				<?php } ?>
				<?php } ?>
				<?php if ($product['recurring']) { ?>
				<br />
				- <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
				<?php } ?>
				<div>
					<span class="price"><?php echo $product['price']; ?></span><span class="number-text">&nbsp;x&nbsp;<?php echo $product['quantity']; ?></span>
				</div>
		  </td>
          
         
          
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"><div class="boss-voucher boss-remove"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn-remove"><i class="fa fa-times"></i></button></div></td>
          <td class="text-left">
			<?php echo $voucher['description']; ?>
			<div>
				<span class="price"><?php echo $voucher['amount']; ?></span><span class="number-text">&nbsp;x&nbsp;1</span>
			</div>
		  </td>
         
          
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div class="boss-mini-cart">
        <table class="table">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-title text-left"><span><?php echo $total['title']; ?></span></td>
           <td class="text-price text-right <?php echo ($total==end($totals) ? ' last' : ''); ?>"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <p class="text-right"><a style="margin-bottom:3px;margin-top:5px;" class="btn btn-primary" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a><a class="btn btn-default" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a></p>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>
