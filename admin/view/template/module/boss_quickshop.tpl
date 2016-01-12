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
  <div class="panel panel-default">
      <div class="panel-heading">			
		<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
    </div>
    <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-boss_quickshop" class="form-horizontal">
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
			<label class="col-sm-2 control-label"><?php echo $entry_text; ?></label>
			<div class="col-sm-10">
				<?php foreach ($languages as $language) { ?>
					<div class="form-group">
						<div class="col-sm-11">
							<input name="boss_quickshop_module[title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($modules['title'][$language['language_id']]) ? $modules['title'][$language['language_id']] : ''; ?>" class="form-control" />
						</div>
						<div class="col-sm-1">
							<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
						</div>
					</div>
				<?php } ?>
			</div>
		</div>
		<div class="form-group">			
			<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="" data-original-title="You have to select class of product which is showed up quickshop" class="help"><?php echo $entry_array_class_select; ?></span></label>
			<div class="col-sm-10">
				<textarea class="form-control" name="boss_quickshop_module[array_class_selected]" ><?php echo isset($modules['array_class_selected']) ? $modules['array_class_selected'] : ''; ?></textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Modal box Width</label>
			<div class="col-sm-10">
				<input type="text" name="boss_quickshop_module[width]" value="<?php echo isset($modules['width'])?$modules['width']:900; ?>" class="form-control" />
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
      </form>
    </div>
  </div>
  </div>
</div> 
<?php echo $footer; ?>