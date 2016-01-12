<div class="box boss-recent-comments">
    <div class="box-heading">
        <div><span><?php echo $heading_title; ?></span></div>
    </div>
    <div class="box-content">
        <?php if($articles){?>
        <ol>
            <?php foreach ($articles as $article) { ?>
            <li class="item recent-comment-item">
                <div class=""><a class="article-title" href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></div>
				<span class="time-stamp">
						<?php $date = new DateTime($article['date_added']);?>
						<?php echo $date->format('l, M j, Y');?></span>
				<div class="comment-by"><?php echo $text_comment;?> <span><?php echo $article['author']; ?></span></div>  
                <div class="item-content">
                    <?php echo $article['comment']; ?>
                </div>  
				
					
					       
				
            </li>
            <?php } ?>
        </ol>
        <?php } else {?>
        <?php echo 'There are no comments.'; ?>
        <?php } ?>
    </div>

</div>
