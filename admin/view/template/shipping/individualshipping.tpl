<?php
echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('view/image/shipping.png'); background-repeat:no-repeat; background-position:left bottom; padding-left: 25px;"><?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
        <tr>
          <td><?php echo $entry_status; ?></td>
          <td><select name="individualshipping_status">
              <?php if ($individualshipping_status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
	<tr>
          <td>Default Pricing: </td>
          <td><input type="text" name="individualshipping_default" value="<?php echo $individualshipping_default; ?>" /></td>
        </tr>
        <tr>
          <td><?php echo $entry_sort_order; ?></td>
          <td><input type="text" name="individualshipping_sort_order" value="<?php echo $individualshipping_sort_order; ?>" size="1" /></td>
        </tr>
      </table>

    </form>
  </div>
</div>
<?php echo $footer; ?>
