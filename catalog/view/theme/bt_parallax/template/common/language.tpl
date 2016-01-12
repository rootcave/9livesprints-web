<?php if (count($languages) > 1) { ?>
<div class="boss-language">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
 
    <button class="btn-language dropdown-toggle" data-toggle="dropdown">
    <?php foreach ($languages as $language) { ?>
    <?php if ($language['code'] == $code) { ?>
	<span><?php echo $language['code']; ?></span>
    
    <?php } ?>
    <?php } ?>
    <i class="fa fa-caret-down"></i></button>
    <ul class="dropdown-menu">
      <?php foreach ($languages as $language) { ?>
      <li><a class="language-select" href="<?php echo $language['code']; ?>"><?php echo $language['code']; ?></a></li>
      <?php } ?>
    </ul>
  
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
