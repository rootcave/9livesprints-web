<div class="box box-search">
	<div class="box-heading"><div><span><?php echo $heading_title; ?></span></div></div>
	<div class="box-content">
		<div id="blogsearch" class="input-group">
		  <input type="text" name="blogsearch" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>" class="form-control input-lg" />
		  <span class="input-group-btn">
			<button type="button" class="btn btn-default btn-lg"><i class="fa fa-search"></i></button>
		  </span>
		</div>
	</div>
	<script type="text/javascript"><!--
	/* Search */
	$('#blogsearch input[name=\'blogsearch\']').parent().find('button').on('click', function() {
		url = $('base').attr('href') + 'index.php?route=bossblog/blogsearch';

		var value = $('#blogsearch input[name=\'blogsearch\']').val();

		if (value) {
			url += '&filter_name=' + encodeURIComponent(value);
		}

		location = url;
	});

	$('#blogsearch input[name=\'blogsearch\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('#blogsearch input[name=\'blogsearch\']').parent().find('button').trigger('click');
		}
	});
	//--></script>
</div>
