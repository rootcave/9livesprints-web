<div class="buttons">
  <div class="pull-right">
	<div style="border:1px dashed ;padding:20px;margin-bottom:20px;font-weight:bold;font-size:18px;color:#50b200;">Do you want to make it Hall of Fame <input type="radio" name="hall_of_fame" value="y" checked="checked" /> Yes <input type="radio" name="hall_of_fame" value="n" /> No </div>
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" data-loading-text="<?php echo $text_loading; ?>" />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {

	var halloffame;
	if($("input:radio[name='hall_of_fame']").is(":checked")){
		halloffame = '&hall_of_fame='+$("input[name='hall_of_fame']:checked").val();
	}else{
		halloffame = '';
	}

	$.ajax({
		type: 'get',
		url: 'index.php?route=payment/cod/confirm'+halloffame,
		cache: false,
		beforeSend: function() {
			$('#button-confirm').button('loading');
		},
		complete: function() {
			$('#button-confirm').button('reset');
		},
		success: function() {
			location = '<?php echo $continue; ?>';
		}
	});
});
//--></script>
