<?php 
$product = $GLOBALS['product'];



?>
<div class="modal fade" id="modal-design-color" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="products-detail col-sm-12">
					<div class="product-detail">
						<div class="row text-right">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						</div>						
						<div class="row col-sm-12">	
							<h4>Click on image to download</h4>
							<div style="margin: 0 auto; text-align: center;  width: 85%;">
							
							<?php 
				
								include_once('config.php');
								$link = mysql_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD) or die("Could connect to the server");
								if ($link){
									mysql_select_db(DB_DATABASE) or die("Database link failed");
								}

								$getvalue = mysql_query("SELECT setting FROM ".DB_PREFIX."module WHERE code = 'boss_gallery' AND name='Design &amp; Color Images'");	   
								if(mysql_num_rows($getvalue)>0){
									while($obj_value = mysql_fetch_array($getvalue)){
										$design_color = unserialize($obj_value['setting']);
										foreach($design_color['boss_gallery_image'] as $key_design_color){
											$imgpath = explode('.',$key_design_color['image']);
								echo '<div style="width:130px; float:left;"><a href="design_download.php?filepath='.$key_design_color['image'].'"><img src="'.HTTP_IMAGE.'cache/'.$imgpath[0].'-100x100.'.$imgpath[1].'" alt="" width="100" height="100" /></a></div>';
										}										
									}								
								}							
							
							?>
							</div>
						</div>								
					</div>
				</div>
			</div>
		</div>
	</div>
</div>