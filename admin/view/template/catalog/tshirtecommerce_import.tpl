<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">     
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
  
	<?php if (isset($error_warning)) { ?>
	<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<?php } ?>
	
	<?php if (isset($success)) { ?>
	<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<?php } ?>
	
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $product_import; ?></h3>
      </div>
      <div class="panel-body">
		<p><?php echo $product_import_msg; ?></p>
		<p><?php echo $product_import_note; ?></p>
		
		<form action="<?php echo $link; ?>" method="post" enctype="multipart/form-data" id="form-attribute">
			<br />
			<div class="form-group required row">
				<label class="col-sm-2 control-label"><?php echo $txt_file; ?></label>
				<div class="col-sm-10">
					<input type="file" name="import_design" value="">
					<input type="hidden" name="import" value="file" class="form-control">
				</div>
			</div>
			
			<?php if (empty($key) && $key == '') { ?>
			<p><strong>Auto Import:</strong> You can use auto import with step by step:</p>
			<ol>
				<li>Go go <strong>T-Shirt eCommerce > Product build</strong> and login</li>
				<li>Copy <a target="_blank" href="http://codecanyon.tshirtecommerce.com/yourkey.png">your key</a></li>
				<li>Go to <strong>T-Shirt eCommerce > Settings</strong></li>
				<li>Add your key</li>
			</ol>
			<?php } ?>
			<p>Click <strong>Auto Import</strong> button to import all data. When use this function, you not need choose file and upload.</p>
			
			<hr />
			
			<div class="form-group required">
				<div class="col-sm-10">
					<br />
					<button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Upload</button>
					 or <a href="<?php echo $link.'&auto=1'; ?>" class="btn btn-primary">Auto import</a>
				</div>
			</div>
		</form>		
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>