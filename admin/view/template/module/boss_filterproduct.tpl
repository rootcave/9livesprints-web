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
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-boss_filterproduct" class="form-horizontal">
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
						<select name="status" id="input-status" class="form-control large">
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
				<div class="row">
					<div class="col-sm-12">
						<ul class="nav nav-tabs" id="module_content">
							<li class="active"><a href="#moduletab" data-toggle="tab"><?php echo $module_tab; ?></a></li>
							<li><a href="#modulesetting" data-toggle="tab"><?php echo $module_setting; ?></a></li>
						</ul>							
						<div class="tab-content">
							<div id="moduletab" class="tab-pane active">
						<table id="tableMoldue" class="table table-striped table-bordered table-hover">
						<thead><tr>
								<td class="left"><?php echo $tab_stt; ?></td>
								<td class="left"><?php echo $tab_title; ?></td>
								<td class="left"><?php echo $tab_get_product; ?></td>
								<td></td></tr></thead>
								<?php $tab_row = 0;?>
								<?php if(isset($module['tabs'])) {?>
								<?php foreach($module['tabs'] as $tab) {?>
								<tbody id="moduletab-row<?php echo $tab_row;?>">
								<tr>
									<td class="left"><?php $tab_stt;?> <b>#<?php echo $tab_row + 1; ?></b></td>
									<td class="left">
									<table class="table table-striped table-bordered table-hover">
									<?php foreach ($languages as $language) { ?><tr><td>
									  <input name="boss_filterproduct_module[tabs][<?php echo $tab_row;?>][title][<?php echo $language['language_id']; ?>]" value="<?php echo isset($tab['title'][$language['language_id']]) ? $tab['title'][$language['language_id']] : ''; ?>" class="form-control" /></td>
									  <td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
									  </td></tr>
									<?php } ?>
									</table></td>
									
									<td class="left">
									<select name="boss_filterproduct_module[tabs][<?php echo $tab_row;?>][type_product]" onchange="showCategories(this,<?php echo $tab_row; ?>)" class="form-control">
									<?php foreach($filter_types as $key_type=>$text){ ?>
									<option value="<?php echo $key_type;?>" <?php if($tab['type_product'] == $key_type) echo "selected=selected";?>><?php echo $text;?></option>
									<?php } ?>
									</select>
									<?php if ($tab['type_product'] == 'category') { ?>
								<?php if (isset($error_category[$tab_row])) { ?>
								<div class="text-danger"><?php echo $error_category[$tab_row]; ?></div>
								<?php } ?>
								<div class="well well-sm" style="height: 150px; overflow: auto;" id="scrollbox<?php echo $tab_row; ?>">
									<?php foreach ($categories as $category) { ?>
									<div class="">
									  <?php if (isset($tab['filter_type_category']) && $category['category_id'] == $tab['filter_type_category']) { ?>
									  <input type="radio" name="boss_filterproduct_module[tabs][<?php echo $tab_row;?>][filter_type_category]" value="<?php echo $category['category_id']; ?>" checked="checked" />
									  <?php echo $category['name']; ?>
									  <?php } else { ?>
									  <input type="radio" name="boss_filterproduct_module[tabs][<?php echo $tab_row;?>][filter_type_category]" value="<?php echo $category['category_id']; ?>" />
									  <?php echo $category['name']; ?>
									  <?php } ?>
									</div>
									<?php } ?>
								  </div>
								<?php } ?>
									</td>
									
									 <td class="text-left"><button type="button" onclick="$('#moduletab-row<?php echo $tab_row;?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
								</tr>
								</tbody>
								<?php $tab_row++;?>
								<?php }?>
								<?php } ?>
								<tfoot><tr><td colspan="3"></td>
								 <td class="text-left"><button type="button" onclick="addTab(this,<?php echo $tab_row;?>);" data-toggle="tooltip" title="<?php echo $button_add_tab; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
								</tr></tfoot></table>
						</div>
							<div id="modulesetting" class="tab-pane">
							<table class="table table-striped table-bordered table-hover">									
								<tr><td><?php echo $entry_image; ?></td>
								<td class="left"><input type="text" name="boss_filterproduct_module[image_width]" value="<?php echo (isset($module['image_width']) ? $module['image_width'] : '') ?>" size="3" class="form-control" />
								
								<input type="text" name="boss_filterproduct_module[image_height]" value="<?php echo (isset($module['image_height']) ? $module['image_height'] : '') ?>" size="3" class="form-control" /> 
								<?php if ($error_image_width) { ?>
								<div class="text-danger"><?php echo $error_image_width; ?></div>
								<?php } ?>
								<?php if ($error_image_height) { ?>
								<div class="text-danger"><?php echo $error_image_height; ?></div>
								<?php } ?></td></tr>
								
								<tr><td><?php echo $entry_limit; ?></td><td class="left">
								<input type="text" name="boss_filterproduct_module[limit]" value="<?php echo (isset($module['limit']) ? $module['limit'] : '') ?>" size="3" class="form-control" /><?php if ($error_limit) { ?>
								<div class="text-danger"><?php echo $error_limit; ?></div>
								<?php } ?></td>
								</tr>
								
								<tr><td><?php echo $entry_use_scrolling_panel; ?></td><td class="left">
								<table class="table table-striped table-bordered table-hover">
								<tr><td>Show Slider:</td>
								<td><select name="boss_filterproduct_module[use_scrolling_panel]" class="form-control">
								<option value="1" <?php if(isset($module['use_scrolling_panel']) && $module['use_scrolling_panel'] == 1) echo "selected=selected"?>><?php echo $text_enabled; ?></option>
								<option value="0" <?php if(isset($module['use_scrolling_panel']) && $module['use_scrolling_panel'] == 0) echo "selected=selected"?>><?php echo $text_disabled; ?></option>
								</select></td></tr>
								<tr><td><?php echo $entry_scroll; ?></td>
								<td>
								<select name="boss_filterproduct_module[scroll]" class="form-control large">
									<option value="1" <?php if(isset($module['scroll']) && $module['scroll']==1) echo 'selected="selected"'; ?>>1</option>
									<option value="2" <?php if(isset($module['scroll']) && $module['scroll']==2) echo 'selected="selected"'; ?>>2</option>
									<option value="3" <?php if(isset($module['scroll']) && $module['scroll']==3) echo 'selected="selected"'; ?>>3</option>
									<option value="4" <?php if(isset($module['scroll']) && $module['scroll']==4) echo 'selected="selected"'; ?>>4</option>
									<option value="5" <?php if(isset($module['scroll']) && $module['scroll']==5) echo 'selected="selected"'; ?>>5</option>
									<option value="6" <?php if(isset($module['scroll']) && $module['scroll']==6) echo 'selected="selected"'; ?>>6</option>			
								</select>
								<?php if ($error_scroll) { ?>
								<div class="text-danger"><?php echo $error_scroll; ?></div>
								<?php } ?> </td></tr>
								</table>
								</td></tr>
								
								<tr><td><?php echo $entry_tab; ?></td><td class="left">
								<select name="boss_filterproduct_module[use_tab]" class="form-control">
								<option value="1" <?php if(isset($module['use_tab']) && $module['use_tab'] == 1) echo "selected=selected";?>><?php echo $text_enabled; ?></option>
								<option value="0" <?php if(isset($module['use_tab']) && $module['use_tab'] == 0) echo "selected=selected";?>><?php echo $text_disabled; ?></option>
								</select></td></tr>
							</table>
							</div>
						
						
						</div>							
						
						
						
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</div>
<script type="text/javascript"><!--
	//var tab_row = <?php echo $tab_row; ?>;;
	// add menu
    function addTab(btnAddTab,tab_row) {
      html  = '<tbody id="moduletab-row'+tab_row+'">';
      html += '<tr>';
      html += '<td class="left"><b>#' + (tab_row+1) + '</b></td><td class="left">';
	  html += '<table class="table table-striped table-bordered table-hover">';
	  <?php foreach ($languages as $language) { ?>
	  html += '<tr><td>';
	  html += '<input type="input" name="boss_filterproduct_module[tabs][' + tab_row + '][title][<?php echo $language['language_id'];?>]" class="form-control"/></td>';
	  html += '<td><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></td></tr>';
		<?php }?>
	  html += '</table>';
	  html += '</td>';
	  
	  html += '<td class="left">';
	  html += '<select name="boss_filterproduct_module[tabs][' + tab_row + '][type_product]" onchange="showCategories(this,' + tab_row + ')" class="form-control">';
	<?php foreach($filter_types as $key=>$text){ ?>
		html += '<option value="<?php echo $key;?>"><?php echo $text;?></option>';
	<?php } ?>
	 html += '</select></td>';    
	 
	 html += '<td class="text-left"><button type="button" onclick="$(\'#moduletab-row' + tab_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	 html += '</tr></tbody>';
	 $('#tableMoldue tfoot').before(html);	 
	 $(btnAddTab).replaceWith('<button type="button" onclick="addTab(this, '+ (tab_row + 1)+ ');" data-toggle="tooltip" title="<?php echo $button_add_tab; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>');
	 
    }
//--></script>
<script type="text/javascript"><!--
    function showCategories(select, row) {
	  if (select.options[select.selectedIndex].value == 'category') {
		divclass = 'odd';
		html  = '<div class="well well-sm" style="height: 150px; overflow: auto;" id="scrollbox' + row + '">';
		<?php foreach ($categories as $category) { ?>
		  divclass = divclass == 'even' ? 'odd' : 'even';
		  html += '<div class="' + divclass + '">';
		  html += '<input type="radio" name="boss_filterproduct_module[tabs][' + row + '][filter_type_category]" value="<?php echo $category['category_id']; ?>" />';
		  html += '<?php echo $category['name']; ?>'
		  html += '</div>';
		<?php } ?>
		html += '</div>';
		  
		$(select).after(html);
	  }
	  else {
		$('#scrollbox' + row).slideUp("normal", function() { $(this).remove(); } );
	  }
    }
  //--></script>
<script type="text/javascript"><!--
$('#module_content li:first-child a').tab('show');
//--></script>
<?php echo $footer; ?>