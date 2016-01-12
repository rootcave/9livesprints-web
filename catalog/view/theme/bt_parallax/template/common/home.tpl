<?php echo $header; ?>
<?php $column_left  = trim($column_left);$column_right  = trim($column_right); ?>

<?php if ($column_left || $column_right) { ?>
<div class="container"><div class="row">
<?php } ?>

	<?php echo $column_left; ?>
	
	<?php if ($column_left && $column_right) { ?>
	<div id="content" class="col-sm-6">
	<?php }else if ($column_left || $column_right) { ?>
	<div id="content" class="col-sm-9">
	<?php }else { ?>
	<div id="content">
	<?php } ?>
		<?php echo $content_top; ?>
		<?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
<?php if ($column_left || $column_right) { ?>
</div></div>
<?php } ?>

<?php echo $footer; ?>