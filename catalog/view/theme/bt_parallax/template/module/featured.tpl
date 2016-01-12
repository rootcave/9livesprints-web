<div class="box">
<div class="box-heading"><div><span><?php echo $heading_title; ?></span></div></div>
<div class="box-content boss-feature">
 <div class="boss-box-product">
  <?php foreach ($products as $product) { ?>
 
    <div class="boss-item">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <div class="name"><a class="boss-name" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <div class="boss-description"><?php echo $product['description']; ?></div>
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
        <?php if ($product['price']) { ?>
        <p class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
         <span class="old-price"><?php echo $product['price']; ?></span> <span class="new-price"><?php echo $product['special']; ?></span> 
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </p>
        <?php } ?>
     
      <div class="button-group">
        <div class="cart"><a onclick="boss_addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-primary"><?php echo $button_cart; ?></a></div>
	   <div class="btn-action-group">
	  <a class="btn-action btn-wishlist" title="<?php echo $button_wishlist; ?>" onclick="boss_addToWishList('<?php echo  $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></a>
	   <a class="btn-action btn-comapre" title="<?php echo $button_compare; ?>" onclick="boss_addToCompare('<?php echo  $product['product_id'];  ?>');"><span><?php echo $button_compare; ?></span></a>
		</div>
      </div>
	   </div>
    </div>
 
  <?php } ?>
   </div>
</div>


</div>
