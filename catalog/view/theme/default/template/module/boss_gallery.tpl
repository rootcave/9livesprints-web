<?php if(!empty($gallery_images)){ ?>
<div class="container ct-gallery">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 not-animated" data-animate="fadeInUp" data-delay="600">
	<div class="boss_gallery">
		<?php if(!empty($heading_title)){ ?>
		<div class="gallery-title"><h3><?php echo $heading_title; ?></h3></div>
		<?php } ?>
		<div id="gallery-container" class="variable-sizes clearfix ">
			<?php foreach ($gallery_images as $gallery_image) { ?>
				<div class="element <?php echo $gallery_image['class']; ?>">
				<a rel="gallery-container" title="<?php echo $gallery_image['gallery_image_description']; ?>" href="<?php echo $gallery_image['link']; ?>" class="swipebox">
					<img src="<?php echo $gallery_image['image']; ?>" alt="<?php echo $gallery_image['gallery_image_description']; ?>">
				</a>
				</div>
			<?php } ?>
		</div>
	</div>
</div>
</div>
</div>
<script type="text/javascript"><!--
	/*$(function(){
      
      var $container = $('#gallery-container');
	  
      $container.isotope({
        itemSelector : '.element',
        masonry : {
          columnWidth : 290
        }
      });
    });*/
//--></script>
<?php } ?>