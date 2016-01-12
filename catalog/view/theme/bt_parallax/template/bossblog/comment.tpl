<div id="comments-header">
    <h1><?php echo $view_comment.' ('.$comment_total.')';?></h1>
</div>
<?php if ($comments) { ?>
<div id="allcomments">
    <?php foreach($comments as $comment){?>
       
            <div class="comment-item">
			<div class="comment-item-header">
			<div class="comment-by"><?php echo $text_comment_by;?>
                <span><?php echo $comment['author'];?></span></div>
			<div class="time-stamp">
                        <?php $date = new DateTime($comment['date_added']);?>
                        <?php echo $date-> format('l, M j Y, h:iA');?>
            </div>
                 </div>
				<div class="comment-body">
					<?php echo $comment['text'];?>
				</div>
                
           
        </div>
    <?php } ?>

<div class="boss-panigation">
        <div class="box-pagination"><?php echo $pagination; ?></div>
        <div class="box-results"><?php echo $results; ?></div>
      </div>
<?php } else { ?>
<div class="allcomments"><?php echo $text_no_comments; ?></div>
<?php } ?>
<script type="text/javascript"><!--
$('#article-comments .pagination a').on('click', function() {
	$('#article-comments').fadeOut('slow');
		
	$('#article-comments').load(this.href);
	
	$('#article-comments').fadeIn('slow');
	
	return false;
});	

//--></script> 