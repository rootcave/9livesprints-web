<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
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
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($products) { ?>
	   <div class="table-responsive">
      <table class="table table-hover boss-table">
        <thead>
          <tr>
            <td class="text-left product-image"><span><?php echo $column_image; ?></span></td>
            <td class="text-left product-name"><span><?php echo $column_name; ?></span></td>
            <td class="text-center product-model"><span><?php echo $column_model; ?></span></td>
			<td class="text-center product-price"><span><?php echo $column_price; ?></span></td>
            <td class="text-center product-stock"><span><?php echo $column_stock; ?></span></td>          
            <td class="text-center product-action"><span><?php echo $column_action; ?></span></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($products as $product) { ?>
          <tr>
            <td class="text-left product-image"><?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
              <?php } ?></td>
            <td class="text-left product-name"><a href="<?php echo $product['href']; ?>" class="boss-name"><?php echo $product['name']; ?></a></td>
            <td class="text-center product-model"><span class="boss-model"><?php echo $product['model']; ?></span></td>
			<td class="text-center product-price"><?php if ($product['price']) { ?>
              <div class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
				<span class="old-price"><?php echo $product['price']; ?></span>
                <span class="new-price"><?php echo $product['special']; ?></span> 
                <?php } ?>
              </div>
              <?php } ?></td>
            <td class="text-center product-stock"><span class="boss-stock"><?php echo $product['stock']; ?></span></td>
            <td class="text-center product-action"><button type="button" onclick="boss_addToCart('<?php echo $product['product_id']; ?>');" data-toggle="tooltip" title="<?php echo $button_cart; ?>" class="btn btn-primary" style="margin-bottom:5px;"><i class="fa fa-shopping-cart"></i></button>
              <a href="<?php echo $product['remove']; ?>" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" style="margin-bottom:5px;"><i class="fa fa-times"></i></a></td>
          </tr>
        <?php } ?>
        </tbody>
      </table>
	  </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 