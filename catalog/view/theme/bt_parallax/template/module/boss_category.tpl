<?php function showSubcate($category) {
	echo '<dd>';
	if (count($category['children']) > 0) {		
		foreach ($category['children'] as $cat) {
			echo(count($cat['children']) >0 ? '<dl class="cate-list-item submenu">':'<dl class="cate-list-item">');
				echo '<dt>';
				echo '<a href="'.$cat['href'].'">'.$cat['name'].'</a>';				
				echo '</dt>';
				showSubcate($cat);
			echo '</dl>';
		}		
	}
	echo '</dd>';
} ?>
<?php //$skin=0 ;?>
<!--module boss-category-->
<div class="box">
<div id="submenu">
	<div class="box-heading"><div><span><?php echo $heading_title; ?></span></div></div>
	<div class="box-content">
	<?php if($skin==1){ ?>
	<div class="submenu-inside">
			<?php foreach ($categories as $category) { ?>
			<dl class="cate-list-item<?php echo($category['children'])? ' submenu':''; ?>">
				<dt class="cate-name"><a href="<?php echo $category['href']; ?>" <?php if ($category['category_id'] == $category_id) echo 'class="active"'; ?>>
					<?php echo $category['name']; ?>
				</a></dt>
				<dd class="sub-cate-list" style="top:-15px;width:<?php echo $width; ?>px">
				<?php for ($i = 0; $i < count($category['children']);) { ?>
					<div class="sub-item" style="width:<?php echo floor($width/$column); ?>px;">
					  <?php $j = $i + ceil(count($category['children'])/$column); ?>
					  <?php for (; $i < $j; $i++) { ?>
						  <?php if (isset($category['children'][$i])) { ?>
						  <dl class="cate-list-item<?php echo($category['children'][$i]['children'])? ' submenu':''; ?>">
							<dt><a href="<?php echo $category['children'][$i]['href']; ?>">
								<?php echo $category['children'][$i]['name']; ?>
							</a></dt>
							
							<?php showSubcate($category['children'][$i]);?>
							</dl>
						  <?php } ?>
					  <?php } ?>
					</div>
				<?php } ?>
				</dd>
			</dl>
			<?php } ?>
		
	</div>
	<?php } else {?>
	<ul class="box-category">
      <?php foreach ($categories as $category) { ?>
      <li>
        <?php if ($category['category_id'] == $category_id) { ?>
        <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
        <?php } else { ?>
        <a href="<?php echo $category['href']; ?>" class="<?php echo $category_id;?>"><?php echo $category['name']; ?></a>
        <?php } ?>
        <?php if ($category['children']) { ?>
        <ul>
          <?php foreach ($category['children'] as $child) { ?>
          <li>
            <?php if ($child['category_id'] == $child_id) { ?>
            <a href="<?php echo $child['href']; ?>" class="active"><?php echo $child['name']; ?></a>
            <?php } else { ?>
            <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
            <?php } ?>
          </li>
          <?php } ?>
        </ul>
        <?php } ?>
      </li>
      <?php } ?>
    </ul>
	<?php } ?>
	</div>
</div>
</div>

<!--module boss-category-->