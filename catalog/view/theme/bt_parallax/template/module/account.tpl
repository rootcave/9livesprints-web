<div class="box account">
<div class="box-heading"><div><span><?php echo $heading_title; ?></span></div></div>
<div class="box-content">
<ul class="boss-list">
  <?php if (!$logged) { ?>
  <li><a href="<?php echo $login; ?>" class="item"><?php echo $text_login; ?></a></li>
   <li><a href="<?php echo $register; ?>" class="item"><?php echo $text_register; ?></a> </li>
   <li><a href="<?php echo $forgotten; ?>" class="item"><?php echo $text_forgotten; ?></a></li>
  <?php } ?>
   <li><a href="<?php echo $account; ?>" class="item"><?php echo $text_account; ?></a></li>
  <?php if ($logged) { ?>
   <li><a href="<?php echo $edit; ?>" class="item"><?php echo $text_edit; ?></a> 
   <li><a href="<?php echo $password; ?>" class="item"><?php echo $text_password; ?></a></li>
  <?php } ?>
   <li><a href="<?php echo $address; ?>" class="item"><?php echo $text_address; ?></a> </li>
   <li><a href="<?php echo $wishlist; ?>" class="item"><?php echo $text_wishlist; ?></a> </li>
   <li><a href="<?php echo $order; ?>" class="item"><?php echo $text_order; ?></a> </li>
   <li><a href="<?php echo $download; ?>" class="item"><?php echo $text_download; ?></a> </li>
   <li><a href="<?php echo $reward; ?>" class="item"><?php echo $text_reward; ?></a> </li>
   <li><a href="<?php echo $return; ?>" class="item"><?php echo $text_return; ?></a> </li>
   <li><a href="<?php echo $transaction; ?>" class="item"><?php echo $text_transaction; ?></a> </li>
   <li><a href="<?php echo $newsletter; ?>" class="item"><?php echo $text_newsletter; ?></a></li>
   <li><a href="<?php echo $recurring; ?>" class="item"><?php echo $text_recurring; ?></a></li>
  <?php if ($logged) { ?>
   <li><a href="<?php echo $logout; ?>" class="item"><?php echo $text_logout; ?></a></li>
  <?php } ?>
 </ul>
</div>
</div>
