<?php echo $header; ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<div id="content">
    <div class="rss-title">
    </div>
    <div class="box-content rss-content">
        <table border="0" style="text-align:left">
        <tr><td colspan="2"><strong><span><?php echo $heading_title; ?></span></strong></td></tr>
        <tr>
            <td><a href="index.php?route=bossblog/bossblog&rss=bossblog"><img border="0" src="catalog/view/theme/default/image/bossblog/rss.png" /></a></td>
            <td><a href="index.php?route=bossblog/bossblog&rss=bossblog"><?php echo $heading_title;?></a></td>
        </tr>
        <tr><td colspan="2"><strong><span><?php echo $text_rss_blog_categories;?></span></strong></td></tr>
        <?php foreach ($categories as $category) { ?>
        <tr>
            <td><a href="<?php echo $category['href']; ?>"><img border="0" src="catalog/view/theme/default/image/bossblog/rss.png" /></a></td>
            <td><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></td>
        </tr>
        <?php if ($category['children']) { ?>
        <?php foreach ($category['children'] as $child) { ?>
        <tr>
            <td class="child"><a href="<?php echo $child['href']; ?>"><img border="0" src="catalog/view/theme/default/image/bossblog/rss.png" /></a></td>
            <td class="child"><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></td>
        </tr>
        <?php } ?>
        <?php } ?>
         <?php } ?>
        </table>
     </div>   
</div>
<?php echo $footer; ?>
