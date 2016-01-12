<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?>
        <?php if ($weight) { ?>
        &nbsp;(<?php echo $weight; ?>)
        <?php } ?>
      </h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive">
          <table class="table boss-table">
            <thead>
              <tr>
                <td class="text-left product-image"><span><?php echo $column_image; ?></span></td>
                <td class="text-left product-name"><span><?php echo $column_name; ?></span></td>
                <td class="text-center product-model"><span><?php echo $column_model; ?></span></td>
                <td class="text-center product-quantity"><span><?php echo $column_quantity; ?></span></td>
                <td class="text-center product-price"><span><?php echo $column_price; ?></span></td>
                <td class="text-center product-total"><span><?php echo $column_total; ?></span></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-left product-image"><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"/></a>
                  <?php } ?></td>
                <td class="text-left product-name"><a href="<?php echo $product['href']; ?>" class="boss-name"><?php echo $product['name']; ?></a>
                  <?php if (!$product['stock']) { ?>
                  <span class="text-danger">***</span>
                  <?php } ?>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <br />
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                  <?php } ?></td>
                <td class="text-center product-model"><span class="boss-model"><?php echo $product['model']; ?></span></td>
                <td class="text-center product-quantity"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                    <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn-update"><i class="fa fa-refresh"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn-remove" onclick="cart.remove('<?php echo $product['key']; ?>');"><i class="fa fa-times"></i></button></span></div></td>
                <td class="text-center product-price"><?php echo $product['price']; ?></td>
                <td class="text-center product-total"><?php echo $product['total']; ?></td>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $vouchers) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?php echo $vouchers['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-center product-quantity"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn-remove" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times"></i></button></span></div></td>
                <td class="text-center product-price"><?php echo $vouchers['amount']; ?></td>
                <td class="text-center product-total"><?php echo $vouchers['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>
      <?php if ($coupon || $voucher || $reward || $shipping) { ?>
      <h2 style="margin-top:40px;margin-bottom:20px;"><?php echo $text_next; ?></h2>
      <p><?php echo $text_next_choice; ?></p>
      <div class="panel-group" id="accordion"><?php echo $coupon; ?></div>
      <?php } ?>
      <br />
	  <div class="boss-mini-cart">
      
       
          <table class="table">
            <?php foreach ($totals as $total) { ?>
            <tr>              
			  <td class="text-title text-left <?php echo ($total==end($totals)? ' last': ''); ?>"><span><?php echo $total['title']; ?>:</span></td>
              <td class="text-price text-right <?php echo ($total==end($totals)? ' last': ''); ?>"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
          </table>
       
      
</div>
      <div class="buttons mini-cart-bt">
        <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_shopping; ?></a></div>
        <div class="pull-right"><a href="<?php echo $checkout; ?>" class="btn btn-primary btn-large"><?php echo $button_checkout; ?></a></div>
      </div>
	 
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 