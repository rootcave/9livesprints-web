<div class="box">
  <div class="box-heading"><div><span><?php echo $heading_title; ?></span></div></div>
  <div class="box-content">
    <div class="boss-alphabet">
      <ul>
        <?php foreach ($alphabet as $char) { ?>
        <li><a href="<?php echo $char['href']; ?>"><?php echo $char['char']; ?></a></li>
        <?php } ?>
      </ul>
	</div>
  </div>
</div>
