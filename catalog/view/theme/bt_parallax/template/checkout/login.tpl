<div class="boss-login">
<div class="row">
  <div class="col-sm-6" style="overflow:hidden;margin-bottom:30px;">
    <h3><?php echo $text_new_customer; ?></h3>
    <p><?php echo $text_checkout; ?></p>
	<div class="boss-checkout-radio">
    <div class="radio">
      <label>
        <?php if ($account == 'register') { ?>
        <input type="radio" name="account" value="register" checked="checked" />
        <?php } else { ?>
        <input type="radio" name="account" value="register" />
        <?php } ?>
        <?php echo $text_register; ?></label>
    </div>
    <?php if ($checkout_guest) { ?>
    <div class="radio">
      <label>
        <?php if ($account == 'guest') { ?>
        <input type="radio" name="account" value="guest" checked="checked" />
        <?php } else { ?>
        <input type="radio" name="account" value="guest" />
        <?php } ?>
        <?php echo $text_guest; ?></label>
    </div>
    <?php } ?>
	</div>
    <p><?php echo $text_register_account; ?></p>
	<div class="boss-button">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-account" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" /></div>
  </div>
  <div class="col-sm-6 right">
    <h3><?php echo $text_returning_customer; ?></h3>
    <p><?php echo $text_i_am_returning_customer; ?></p>
    <div class="form-group">
      <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
      <div class="boss-input"><input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" /></div>
    </div>
    <div class="form-group">
      <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
      <div class="boss-input"><input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" /></div>
      </div>
    <div class="boss-button" style="margin-top:14px;margin-bottom:5px;">
	<input type="button" value="<?php echo $button_login; ?>" id="button-login" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
	</div>
	<a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
  </div>
</div>
</div>