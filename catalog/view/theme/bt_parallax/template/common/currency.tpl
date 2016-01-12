<?php if (count($currencies) > 1) { ?>
<div class="boss-currency">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
  
    <button class="btn-currency dropdown-toggle" data-toggle="dropdown">
    <?php foreach ($currencies as $currency) { ?>
    <?php if ($currency['code'] == $code) { ?>
    <span><?php echo $currency['code']; ?></span>
    <?php }  ?>    
    <?php } ?>
    <i class="fa fa-caret-down"></i></button>
    <ul class="dropdown-menu">
      <?php foreach ($currencies as $currency) { ?>      
      <li><button class="currency-select" type="button" name="<?php echo $currency['code']; ?>"> <?php echo $currency['code']; ?></button></li>
      <?php } ?>
    </ul>
  
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
