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
			
			$reg_design_color = new ModelDesignColorDesignColor($this->registry);
			$designs = $reg_design_color->getDesignColor();
			
			if (!empty($designs)) { 			
			$design_colors = unserialize($designs);
			foreach ($design_colors['boss_gallery_image'] as $key_design) { 
			//http://dev.9livesprints.com/image/cache/catalog/logofooter-100x100.png

			$reg_design_color = new ModelDesignColorDesignColor($this->registry);
			$designs = $reg_design_color->getDesignColor();


			$reg_image = new ModelToolImage($this->registry);
			$image_src_path = $reg_image->resize($key_design['image'], '100', '100');

		?>

		<div style="float:left; width:20%; ">					
			<div style="text-align:center;"><a href="/9livesprints_functions/download.php?file_path=<?php echo '../image/'.$key_design['image']; ?>&file_name="><img src="<?php echo $image_src_path; ?>" /></a><br /><a href="/9livesprints_functions/download.php?file_path=<?php echo '../image/'.$key_design['image']; ?>&file_name=">Download</a></div>  			
		</div>   
		<?php  }
		 } else { 
		?>
			<div style="text-align:center;">No record!!</div>  
		<?php } ?>

		<div style="clear:both;"></div>

			  
	  </div>
	  
	  </div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 