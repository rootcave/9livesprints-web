<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> boss-login"><?php echo $content_top; ?>
	 <h1 class="title"><?php echo $heading_title; ?></h1>
      <div class="row">
        <div class="col-sm-6" style="margin-bottom:30px; overflow:hidden;">
          <div class="">
            
            <h3 style="margin-bottom:18px;"><?php echo $text_register; ?></strong></h3>
            <p><?php echo $text_register_account; ?></p>
			<div class="boss-button">
            <a href="<?php echo $register; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div></div>
        </div>
        <div class="col-sm-6 right">
          <div class="">
           
            <h3 style="margin-bottom:18px;"><?php echo $text_i_am_returning_customer; ?></strong></h3>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                <div class="boss-input"><input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" /></div>
              </div>
              <div class="form-group">
                <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                <div class="boss-input"><input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" /></div>
                </div>
				<div class="boss-button" style="margin-top:14px;margin-bottom:5px;">
<input type="checkbox" name="<?php echo $button_remember_me;?>" value="1"  style="vertical-align: middle;"/> <span style="vertical-align: middle;"><?php echo $remember_me;?></span><br />
          <br />
              <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
			  </div>
			  <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
              <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            </form>
<?php echo $content_bottom; ?>
          </div>
        </div>
      </div>
      </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>