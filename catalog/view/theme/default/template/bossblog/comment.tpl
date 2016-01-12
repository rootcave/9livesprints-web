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
/*$('#button-comment').bind('click', function() { 
	$.ajax({
		url: 'index.php?route=bossblog/article/write&blog_article_id=<?php echo $blog_article_id; ?>&need_approval=<?php echo $need_approval; ?>&approval_status=<?php echo $approval_status; ?>',
		type: 'post',
		dataType: 'json',
		data: 'username=' + encodeURIComponent($('input[name=\'username\']').val()) + '&comment_content=' + encodeURIComponent($('textarea[name=\'comment_content\']').val()) + '&email=' + encodeURIComponent($('input[name=\'email_blog\']').val()) + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-comment').attr('disabled', true);
			$('#new').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-comment').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#new').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#new').after('<div class="success">' + data['success'] + '</div>');
				$('#article-comments').load('index.php?route=bossblog/article/comment&blog_article_id=<?php echo $blog_article_id; ?>');				
				$('input[name=\'username\']').val('');
				$('textarea[name=\'comment_content\']').val('');
				$('input[name=\'email_blog\']').val('');
                $('input[name=\'captcha\']').val('');
			}
		}
	});
});*/
//--></script> 