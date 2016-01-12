<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">     
      <h1><?php echo $heading_title; ?> - Settings</h1>
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
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">	
		<form action="<?php echo $link; ?>" method="post" id="form-attribute">
			<div class="form-group">
				<div class="col-md-10">
					<label>Product default</label>
				</div>
				<div class="col-md-10">
					<?php if ($products == 0) { ?>
					Please add product design.
					<?php } else { ?>
					
					<select name="tshirtecommerce_product" class="form-control">
					<?php 
						foreach($products as $product) {
							if ($product_id == $product['product_id'])
								$select = 'selected="selected"';
							else
								$select = '';
					?>
						<option <?php echo $select; ?> value="<?php echo $product['product_id']; ?>"><?php echo $product['name']; ?></option>
					<?php } ?>
					</select>
					
					<?php } ?>
				</div>				
				<div class="col-md-10">
					<p class="text-muted">Choose product default. It is very important. This product will show in designer.</p>
				</div>
			</div>
			
			<div class="form-group">				
				<div class="col-md-2">
					<button type="submit" class="btn btn-primary">Save</button>
				</div>				
			</div>
		</form>		
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>