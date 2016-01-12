<div class="box tagcloud">
    <div class="box-heading">
	   <div><span><?php echo $heading_title; ?></span></div>
    </div>
		
    <div class="box-content" style="text-align:left;"> 
		<?php if($boss_tagcloud) { ?>
		  <?php echo $boss_tagcloud; ?>
		<?php } else { ?>
		  <?php echo $text_notags; ?>
		<?php } ?>
    </div>
</div>
