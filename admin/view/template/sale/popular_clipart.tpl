<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">      
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">    
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> Popular Cliparts</h3>
      </div>
      <div class="panel-body">      
          <div class="table-responsive">
           
                <?php 
					if ($cliparts) { 				 
					foreach ($cliparts as $key_clipart) { 
				?>

				<div style="float:left; width:20%; ">					
                    <div style="text-align:center;"><img src="<?php echo $key_clipart['clipart_thumb']; ?>" /><br /><br /></div>  
					<div style="text-align:center;"><?php echo $key_clipart['clipart_title']; ?> </div> 
                </div>   
                <?php  }
                 } else { 
				?>
					<div style="text-align:center;">No record!!</div>  
                <?php } ?>
				
          </div>    
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>