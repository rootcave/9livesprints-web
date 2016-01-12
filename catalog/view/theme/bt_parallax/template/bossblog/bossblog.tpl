<?php echo $header; ?>
<?php global $config; ?>
<?php 
	$view='both_grid'; $boss_class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12';
	if($config->get('boss_manager')){
		$boss_manager = $config->get('boss_manager'); 
	}else{
		$boss_manager = '';
	}
	if(!empty($boss_manager)){				
		$view = isset($boss_manager['other']['view_pro'])?$boss_manager['other']['view_pro']:'both_grid';
		$perrrow = isset($boss_manager['other']['perrow'])?$boss_manager['other']['perrow']:3;
	}
	if(isset($perrrow) && $perrrow==1){
		$boss_class = 'col-lg-12 col-md-12 col-sm-12 col-xs-12';
	}else if(isset($perrrow) && $perrrow==2){
		$boss_class = 'col-lg-6 col-md-6 col-sm-6 col-xs-12';
	}else if(isset($perrrow) && $perrrow==3){
		$boss_class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12';
	}else if(isset($perrrow) && $perrrow==4){
		$boss_class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12';
	}else if(isset($perrrow) && $perrrow==5){
		$boss_class = 'boss-col-5column col-md-3 col-sm-6 col-xs-12';
	}else if(isset($perrrow) && $perrrow==6){
		$boss_class = 'col-lg-2 col-md-3 col-sm-6 col-xs-12';
	}
?>
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
      <h2><?php echo $heading_title; ?></h2>
	  <?php if ($articles) { ?>      
      <div class="product-filter">
        
		<div class="boss-rss">
			<div class="rss-feed">
				<a href="<?php echo $link_rss; ?>" title='RSS'><img src='image/catalog/bossblog/rss.png' alt='Rss' /></a>
			</div>
		</div>
		<div class="boss-limit-sort">
        <div class="boss-title">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="box-select sort-select">
          <select id="input-sort" class="form-control selectpicker col-sm-3" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="boss-title">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="box-select limit-select">
          <select id="input-limit" class="form-control selectpicker" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
		</div>
          <div class="boss-list-grid" <?php if($view == 'grid' || $view =='list')echo 'style="display:none"'; ?>>
            <button type="button" id="list-view" class="btn btn-default list" data-toggle="tooltip" title="<?php echo $text_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default grid" data-toggle="tooltip" title="<?php echo $text_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        
      </div>
      <br />
      <div class="row">
        <?php foreach ($articles as $article) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb product-thumb-block">
            <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" class="img-responsive" /></a></div>
           
				<div class="caption">
					<div class="article-name"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></div>
					<div class="time-stamp">
						<?php $date = new DateTime($article['date_modified']);?>
						<small><?php echo $date->format('l, M j, Y');?></small>
					</div>
					<div class="article-content"><?php echo $article['title']; ?></div>   
				
					<div class="article-footer">
						<span class="post-by"> <?php echo $text_postby;?> <span><?php echo $article['author']; ?></span></span>
						<span>&nbsp;|&nbsp;</span>
						<span class="comment-count"><span><?php echo $article['comment']; ?> </span><a href="<?php echo $article['href']; ?>"><?php echo $text_comment;?></a></span>                 
					</div>
				</div>
            </div>
          
        </div>
        <?php } ?>
      </div>
      <div class="boss-panigation">
        <div class="box-pagination"><?php echo $pagination; ?></div>
        <div class="box-results"><?php echo $results; ?></div>
      </div>
      <?php }else{ ?>
	  <p><?php echo $text_empty; ?></p>
	  <?php } ?>
	<?php echo $content_bottom; ?></div>	
    <?php echo $column_right; ?>
  </div>
</div>
<script type="text/javascript"><!--
// Product List
	$('#list-view').click(function() {
		$('#content .product-layout > .clearfix').remove();

		$('#content .product-layout').attr('class', 'product-layout product-list col-xs-12');

		localStorage.setItem('display', 'list');
	});

	// Product Grid
	$('#grid-view').click(function() {
		$('#content .product-layout > .clearfix').remove();

		// What a shame bootstrap does not take into account dynamically loaded columns
		cols = $('#column-right, #column-left').length;

		if (cols == 2) {
			$('#content .product-layout').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');

			$('#content .product-layout:nth-child(2)').after('<div class="clearfix visible-md visible-sm"></div>');
		} else if (cols == 1) {
			$('#content .product-layout').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');

			$('#content .product-layout:nth-child(3)').after('<div class="clearfix visible-lg"></div>');
		} else {
			$('#content .product-layout').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');

			$('#content .product-layout:nth-child(4)').after('<div class="clearfix"></div>');
		}

		 localStorage.setItem('display', 'grid');
	});
	
	if (localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');
	}else if (localStorage.getItem('display') == 'grid'){
		$('#grid-view').trigger('click');
	} else {
		<?php if($view == 'grid' || $view == 'both_grid') { ?>
			$('#grid-view').trigger('click');
		<?php } ?>
		<?php if($view == 'list' || $view == 'both_list') { ?>
			$('#list-view').trigger('click');
		<?php } ?>
	}
//--></script>
<?php echo $footer; ?>
	
