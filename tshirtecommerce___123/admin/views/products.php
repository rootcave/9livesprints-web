<?php if (isset($msg)) { ?>
<div class="row">
	<div class="col-md-12">
		<div class=" alert alert-success"><?php echo $msg; ?></div>
	</div>
</div>
<?php } ?>

<form id="adminForm" method="post" name="adminForm" action="<?php echo site_url('products'); ?>">
<div class="row">
	<div class="col-md-6">
		<div class="row">
			<div class="col-sm-2">
				<?php $option = array('5'=>5, '10'=>10, '15'=>15, '20'=>20, '25'=>25, '100'=>100,'all'=>lang('all', true));?>
				<select class="form-control option_products" name="per_page">
					<?php
						foreach($option as $key=>$val)
						{
							if($key == '10')
								echo '<option value="'.$key.'" selected="">'.$val.'</option>';
							else
								echo '<option value="'.$key.'">'.$val.'</option>';
						}
					?>
				</select>
			</div>
			<div class="col-sm-4">
				<input type="text" name="search_product" class="form-control txt_search" placeholder="<?php lang('search'); ?>">
			</div>
			<div class="col-sm-4">
				<button type="button" class="btn btn-primary btn-search" onclick="pagination(0)"><?php lang('search'); ?></button>
			</div>
		</div>
	</div>
	
	<div class="col-md-6">
		<p class="pull-right">
			<a href="<?php echo site_url('index.php/product/edit'); ?>" class="btn btn-primary">
				<i class="glyphicon glyphicon-plus"></i> <?php lang('add'); ?>
			</a>			
		<p>
	</div>
</div>
<div class="table-responsive">
	<table class="table table-bordered table-hover" id="sample-table-1">
		<thead>
			<tr>
				<th class="center" width="5%">
					<input type="checkbox" onclick="dgUI.checkAll(this)" id="select_all">
				</th>
				<th class="center"><?php lang('product_name'); ?></th>
				<th width="10%" class="center"><?php lang('product_sku'); ?></th>
				<th width="10%" class="center"><?php lang('product_sale_price'); ?></th>
				<th width="20%" class="center"><?php lang('product_image'); ?></th>				
				<th width="10%" class="center"><?php lang('published'); ?></th>
				<th width="10%" class="center"><?php lang('action'); ?></th>
				<th width="5%" class="center"><?php lang('id'); ?></th>
			</tr>
		</thead>
		<tbody>	
		<?php if (isset($data['products']) && count($data['products']) > 0) { ?>
		<?php $i = 0; foreach ($data['products'] as $key=>$product) { ?>
		<?php 
			if($i < 10){
		?>
			
			<tr>
				<td class="center">
					<input type="checkbox" class="checkb" value="<?php echo $product->id; ?>" name="ids[]" />
				</td>
				<td>
					<a href="<?php echo site_url('index.php/product/edit/' . $product->id); ?>" title=""><?php echo $product->title; ?></a>
				</td>
				<td class="center">
					<?php echo $product->sku; ?>
				</td>
				<td class="center">
					<?php if ($product->sale_price > 0) echo $product->sale_price; else echo $product->price; ?>
				</td>
				<td class="center">
					<img src="<?php echo $product->image; ?>" alt="" width="150"/>
				</td>			
				<td class="center">
					<?php if ($product->published == 1){ ?>
						<a href="<?php echo site_url('index.php/product/unpublish/' . $product->id); ?>" class="btn btn-success btn-xs"><?php lang('publish'); ?></a>
					<?php }else{ ?>
						<a href="<?php echo site_url('index.php/product/publish/' . $product->id); ?>" class="btn btn-bricky btn-xs"><?php lang('unpublish'); ?></a>
					<?php } ?>
				</td>
				<td class="center">
					<div class="btn-group">
						<button type="button" class="btn btn-teal btn-xs">
							<i class="glyphicon glyphicon-cog"></i>
						</button>
						<button type="button" class="btn btn-teal btn-xs dropdown-toggle" data-toggle="dropdown">
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<?php echo site_url('index.php/product/edit/' . $product->id); ?>"><i class="icon-edit"></i> <?php lang('edit'); ?></a></li>							
							<li><a href="<?php echo site_url('index.php/product/delete/' . $product->id); ?>"><i class="glyphicon glyphicon-trash"></i> <?php lang('remove'); ?></a></li> 							
						</ul>
					</div>
				</td>
				<td class="center">
					<?php echo $product->id; ?>
				</td>
			</tr>
			
		<?php } ?>
		<?php $i++;} ?>
		</tbody>
	</table>

	<div class="row">
		<div class="dataTables_paginate paging_bootstrap" style="float: right;">
			<div class="col-md-12">
				<?php
					if(count($data['products']) > 10)
					{
						$count = count($data['products'])/10;
						if($count > (int)$count)
							$count = (int)$count + 1;
						if($count > 5)
						{
							$pageall = true;
							$count = 5;
						}else
						{
							$pageall = false;
						}
						echo '<ul class="pagination">';
							for($i=1; $i<=$count; $i++)
							{
								if($i == 1)
									echo '<li class="active"><a href="javascript:void(0);">'.$i.'</a></li>';
								else
									echo '<li><a href="javascript:void(0);" onclick="pagination('.(($i-1)*10).')">'.$i.'</a></li>';
							}
						echo '<li>
								<a href="javascript:void(0);" aria-label="'.lang('next', true).'" onclick="pagination(10)">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>';
						if($pageall)
							echo '<li><a href="javascript:void(0);" onclick="pagination('.(count($data['products'])-10).')"><span aria-hidden="true">&raquo;</span></a></li>';
						echo '</ul>';
					}
				?>
			</div>
	   </div>
	</div>
	<?php } ?>
</div>
	<input type="hidden" value="" name="action" id="submit-action" />
</form>

<script type="text/javascript">
	jQuery(document).ready(function(){
		jQuery('#adminForm').submit(function() {
			return false;
		});
			
		jQuery('.txt_search').keyup(function(e){
			if(e.keyCode == 13)
			{
				pagination(0);
			}
		});
	});
	
	jQuery('.option_products').change(function(){
		pagination(0);
	});
	function pagination(segment)
	{
		jQuery.ajax({
			type: "POST",
			url: '<?php echo site_url('index.php/product/page/'); ?>'+segment,
			data: jQuery('#adminForm').serialize(),
			dataType: 'html',
			beforeSend: function(){
				jQuery('#adminForm').block({
					overlayCSS: {
						backgroundColor: '#fff'
					},
					message: '<img src="<?php echo site_url().'assets/images/loading.gif'?>" /> <?php lang('loading') ?>',
					css: {
						border: 'none',
						color: '#333',
						background: 'none'
					}
				});
			},
			success: function(data){
				if(data != '')
				{
					jQuery('.table-responsive').html(data);
				}
				jQuery('#adminForm').unblock();
			},
		});
	}
</script>