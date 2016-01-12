<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      
	  
	  <div class="boss-description">
	  
		<?php 
			if ($cliparts) { 				 
			foreach ($cliparts as $key_clipart) { 
		?>

		<div style="float:left; width:20%; ">					
			<div style="text-align:center;"><img src="<?php echo $key_clipart['clipart_thumb']; ?>" /><br /><br /></div>  
			<div style="text-align:center;"><?php echo $key_clipart['clipart_title']; ?> </div> 
		</div>   
		<?php  }
		 } else { 
		?>
			<div style="text-align:center;">No record!!</div>  
		<?php } ?>

		<div style="clear:both;"></div>

		<div class="boss-panigation">
			<div class="box-pagination"><?php echo $pagination; ?></div>
			<div class="box-results"><?php echo $results; ?></div>
        </div>
	  
	  </div>
	  
	  </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 