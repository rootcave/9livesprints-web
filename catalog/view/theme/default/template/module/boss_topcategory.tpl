<?php if(!empty($categories)){ ?>
<div class="container">
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-12 not-animated" data-animate="fadeInUp" data-delay="300">
<div class="popular-cate">
	<div class="box-heading">
		<h1><?php echo $heading_title; ?></h1>
	</div>
	<div class="row">
	<?php foreach ($categories as $category) { ?>
	
	<div class="box-content col-lg-4 col-md-4 col-sm-4 col-xs-12">
		<div class="cate-image"><a title="<?php echo $category['title']; ?>" href="<?php echo $category['href']; ?>"><img alt="<?php echo $category['title']; ?>" src="<?php echo $category['image']; ?>" /></a></div>
		<div class="cate-name"><h3><?php echo $category['title']; ?></h3></div>
		<div class="sub_cat">
			<?php foreach ($category['children_data'] as $children) { ?>
				<div class="sub_item">
					<a title="<?php echo $children['name']; ?>" href="<?php echo $children['href']; ?>"><?php echo $children['name']; ?></a>
				</div>
			<?php } ?>
		</div>
    </div>
	<?php } ?>
	</div>
	</div>
</div>
</div></div>
<?php } ?>
