<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
		<a onclick="confirm('Are you sure? All the data of this module will lost! The new data will same as homepage default.') ? location.href='<?php echo $restore; ?>' : false;" data-toggle="tooltip" title="Restore" class="btn btn-success"><i class="glyphicon glyphicon-import"></i></a>
		</div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
	<?php if ($error_warning) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
	<?php } ?>
	<?php if (isset($_SESSION["restore"])) { ?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $_SESSION["restore"]; ?>
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php unset($_SESSION["restore"]); } ?>
    <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-boss_zoom" class="form-horizontal">				
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
			</div>
			<div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
        </div>  
		<h3 class="bztitle"><?php echo $text_information; ?></h3>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $text_image_Thumb; ?></label>
            <div class="col-sm-10">
				<input type="text" name="boss_zoom_module[thumb_image_width]" value="<?php echo isset($modules['thumb_image_width'])?$modules['thumb_image_width']:''; ?>" size="3" class="form-control" /> 
				<input type="text" name="boss_zoom_module[thumb_image_height]" value="<?php echo isset($modules['thumb_image_height'])?$modules['thumb_image_height']:''; ?>" size="3" class="form-control" />
				<?php if ($error_thumb_image_width) { ?>
                <div class="text-danger"><?php echo $error_thumb_image_width; ?></div>
                <?php } ?>
				<?php if ($error_thumb_image_height) { ?>
                <div class="text-danger"><?php echo $error_thumb_image_height; ?></div>
                <?php } ?>
				
            </div>
        </div> 
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $text_image_Addition; ?></label>
            <div class="col-sm-10">
				<input type="text" name="boss_zoom_module[addition_image_width]" value="<?php echo isset($modules['addition_image_width'])?$modules['addition_image_width']:''; ?>" size="3" class="form-control" />
				<input type="text" name="boss_zoom_module[addition_image_height]" value="<?php echo isset($modules['addition_image_height'])?$modules['addition_image_height']:''; ?>" size="3" class="form-control" />
				<?php if ($error_addition_image_width) { ?>
                <div class="text-danger"><?php echo $error_addition_image_width; ?></div>
                <?php } ?>
				<?php if ($error_addition_image_height) { ?>
                <div class="text-danger"><?php echo $error_addition_image_height; ?></div>
                <?php } ?>
            </div>
        </div>
		<div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $text_image_Zoom; ?></label>
            <div class="col-sm-10">
				<input type="text" name="boss_zoom_module[zoom_image_width]" value="<?php echo isset($modules['zoom_image_width'])?$modules['zoom_image_width']:''; ?>" size="3" class="form-control" />
				<input type="text" name="boss_zoom_module[zoom_image_height]" value="<?php echo isset($modules['zoom_image_height'])?$modules['zoom_image_height']:''; ?>" size="3" class="form-control" />
				<?php if ($error_zoom_image_width) { ?>
                <div class="text-danger"><?php echo $error_zoom_image_width; ?></div>
                <?php } ?>
				<?php if ($error_zoom_image_height) { ?>
                <div class="text-danger"><?php echo $error_zoom_image_height; ?></div>
                <?php } ?>
            </div>
        </div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-top"><span data-toggle="tooltip" title="" data-original-title="<?php echo $text_auto_size_area; ?>"><?php echo $text_area_Zoom; ?></span></label>
            <div class="col-sm-10">
				<input type="text" name="boss_zoom_module[zoom_area_width]" value="<?php echo isset($modules['zoom_area_width'])?$modules['zoom_area_width']:''; ?>" size="3" class="form-control" /> 
				<input type="text" name="boss_zoom_module[zoom_area_height]" value="<?php echo isset($modules['zoom_area_height'])?$modules['zoom_area_height']:''; ?>" size="3" class="form-control" />
				<?php if ($error_zoom_area_width) { ?>
                <div class="text-danger"><?php echo $error_zoom_area_width; ?></div>
                <?php } ?>
				<?php if ($error_zoom_area_height) { ?>
                <div class="text-danger"><?php echo $error_zoom_area_height; ?></div>
                <?php } ?>
            </div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-top"><?php echo $text_area_position; ?></label>
            <div class="col-sm-10">
				<select name="boss_zoom_module[position_zoom_area]" id="input-status" onchange="changeZoomPosition(this.value)" class="form-control">
                <?php if (isset($modules['position_zoom_area']) && $modules['position_zoom_area']=='right') { ?>
                <option value="right" selected="selected"><?php echo $text_right; ?></option>
                <option value="inside"><?php echo $text_Inner; ?></option>
                <?php } else { ?>
                <option value="right"><?php echo $text_right; ?></option>
                <option value="inside" selected="selected"><?php echo $text_Inner; ?></option>
                <?php } ?>
              </select>
            </div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-top"><span data-toggle="tooltip" title="" data-original-title="<?php echo $text_distance; ?>"><?php echo $text_Adjust; ?></span></label>
            <div class="col-sm-10">
				<input id="adjustX" type="text" name="boss_zoom_module[adjustX]" value="<?php echo isset($modules['adjustX'])?$modules['adjustX']:0; ?>" size="3" class="form-control" />
				<input id="adjustY" type="text" name="boss_zoom_module[adjustY]" value="<?php echo isset($modules['adjustY'])?$modules['adjustY']:0; ?>" size="3" class="form-control" />
				<?php if ($error_adjustX) { ?>
                <div class="text-danger"><?php echo $error_adjustX; ?></div>
                <?php } ?>
				<?php if ($error_adjustY) { ?>
                <div class="text-danger"><?php echo $error_adjustY; ?></div>
                <?php } ?>
            </div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-top"><?php echo $text_title; ?></label>
            <div class="col-sm-10">
				<select name="boss_zoom_module[title_image]" id="input-status" class="form-control">
                <?php if (isset($modules['title_image']) && $modules['title_image']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
        </div>
		<div class="form-group">	
			<label class="col-sm-2 control-label" for="input-top"><?php echo $text_title_opacity; ?></label>
			<div class="col-sm-10">
				<input type="text" name="boss_zoom_module[title_opacity]" value="<?php echo isset($modules['title_opacity'])?$modules['title_opacity']:0.5; ?>" size="3" class="form-control" />
				<?php if ($error_title_opacity) { ?>
                <div class="text-danger"><?php echo $error_title_opacity; ?></div>
                <?php } ?>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-top"><?php echo $text_Tint; ?></label>
			<div class="col-sm-10">
				<input type="text" name="boss_zoom_module[tint]" value="<?php echo isset($modules['tint'])?$modules['tint']:''; ?>" size="10" class="form-control" />
			</div>
		</div>
		<div class="form-group">	
			<label class="col-sm-2 control-label" for="input-top"><?php echo $text_Tint_opacity; ?></label>
			<div class="col-sm-10">
				<input type="text" name="boss_zoom_module[tintOpacity]" value="<?php echo isset($modules['tintOpacity'])?$modules['tintOpacity']:0.5; ?>" size="3" class="form-control" />
				<?php if ($error_tintOpacity) { ?>
                <div class="text-danger"><?php echo $error_tintOpacity; ?></div>
                <?php } ?>
			</div>
		</div>				
            
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-top"><?php echo $text_softFocus; ?></label>
            <div class="col-sm-10">				
				<select name="boss_zoom_module[softfocus]" id="input-status" class="form-control">
                <?php if (isset($modules['softfocus']) && $modules['softfocus']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>			
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-top"><?php echo $text_Opacity_lens; ?></label>
            <div class="col-sm-10">
				<input type="text" name="boss_zoom_module[lensOpacity]" value="<?php echo isset($modules['lensOpacity'])?$modules['lensOpacity']:''; ?>" size="3" class="form-control" />
				<?php if ($error_lensOpacity) { ?>
                <div class="text-danger"><?php echo $error_lensOpacity; ?></div>
                <?php } ?>
            </div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-top"><?php echo $text_Smooth; ?></label>
            <div class="col-sm-10">
				<input type="text" name="boss_zoom_module[smoothMove]" value="<?php echo isset($modules['smoothMove'])?$modules['smoothMove']:''; ?>" size="3" class="form-control" />
				<?php if ($error_smoothMove) { ?>
                <div class="text-danger"><?php echo $error_smoothMove; ?></div>
                <?php } ?>
            </div>
        </div>		
      </form>
    </div>
    </div>
  </div>
</div>
<script type="text/javascript">
	function changeZoomPosition(value){
		if(value=='inside'){
			$('#adjustX').val("0"); 
			$('#adjustY').val("0");
		}
	}	
</script>
<?php echo $footer; ?>