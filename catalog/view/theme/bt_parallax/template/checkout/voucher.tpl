<div class="panel panel-default">
  <div class="panel-heading">
    <h4 class="panel-title"><a href="#collapse-voucher" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><span class="ui-icon ui-icon-carat-1-e"></span><?php echo $heading_title; ?></a></h4>
  </div>
  <div id="collapse-voucher" class="panel-collapse collapse">
    <div class="panel-body">
      <label class="control-label" for="input-voucher"><?php echo $entry_voucher; ?></label>
      <div class="boss-input">
        <input type="text" name="voucher" value="<?php echo $voucher; ?>" placeholder="<?php echo $entry_voucher; ?>" id="input-voucher" class="form-control" />
		</div>
        <div class="boss-button" style="margin-top:15px;">
        <input type="submit" value="<?php echo $button_voucher; ?>" id="button-voucher" data-loading-text="<?php echo $text_loading; ?>"  class="btn btn-primary" />
        </div> 
      <script type="text/javascript"><!--
$('#button-voucher').on('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/voucher/voucher',
    type: 'post',
    data: 'voucher=' + encodeURIComponent($('input[name=\'voucher\']').val()),
    dataType: 'json',
    beforeSend: function() {
      $('#button-voucher').button('loading');
    },
    complete: function() {
      $('#button-voucher').button('reset');
    },
    success: function(json) {
      $('.alert').remove();

      if (json['error']) {
        $('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

        $('html, body').animate({ scrollTop: 0 }, 'slow');
      }

      if (json['redirect']) {
        location = json['redirect'];
      }
    }
  });
});
//--></script>
    </div>
  </div>
</div>
