<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
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
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left" colspan="2"><?php echo $text_order_detail; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left" style="width: 50%;"><?php if ($invoice_no) { ?>
              <b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?><br />
              <?php } ?>
              <b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
              <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
            <td class="text-left"><?php if ($payment_method) { ?>
              <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
              <?php } ?>
              <?php if ($shipping_method) { ?>
              <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
              <?php } ?></td>
          </tr>
        </tbody>
      </table>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left" style="width: 50%;"><?php echo $text_payment_address; ?></td>
            <?php if ($shipping_address) { ?>
            <td class="text-left"><?php echo $text_shipping_address; ?></td>
            <?php } ?>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left"><?php echo $payment_address; ?></td>
            <?php if ($shipping_address) { ?>
            <td class="text-left"><?php echo $shipping_address; ?></td>
            <?php } ?>
          </tr>
        </tbody>
      </table>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_name; ?></td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-right"><?php echo $column_quantity; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>
              <td class="text-right"><?php echo $column_total; ?></td>
              <?php if ($products) { ?>
              <td style="width: 20px;"></td>
              <?php } ?>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td class="text-left"><?php echo $product['name']; ?>


			  <!-- // ************************** suman *************************** -->
				

				<br />
				<?php if ( isset($product['design']) && $product['design'] != false) { $design = $product['design'];?>
				 
				<?php if(isset($design->color_title)) { ?>
				<small><strong>Color:</strong> <span title="<?php echo $design->color_title; ?>" style="background-color:#<?php echo $design->color_hex; ?>;display:inline-block;border:1px solid #ccc;width:25px;height:25px;cursor:pointer;outline:1px solid #229BCA;margin-left 4px;"></span></small><br />
				<?php } ?>
				 
				<?php if(empty($design->color_title)){ if(isset($design['idea'])) { ?>
				<p>
				<a title="click to view design" target="_blank" href="<?php echo $tshirtecommerce_url; ?>&product_id=<?php echo $design[0].':'.$design[1].':'.$design[2].':'.$design[3].':'.$design[4]; ?>&parent_id=<?php echo $design[4]; ?>"><strong>View Design</strong></a>
				or Download design:
				<a title="click to download design" target="_blank" href="<?php echo $base_url; ?>tshirtecommerce/download_idea.php?key=<?php echo $design[0].':'.$design[1].':'.$design[2].':'.$design[3].':'.$design[4]; ?>&view=front"><strong>Front</strong></a> - 
				<a title="click to download design" target="_blank" href="<?php echo $base_url; ?>tshirtecommerce/download_idea.php?key=<?php echo $design[0].':'.$design[1].':'.$design[2].':'.$design[3].':'.$design[4]; ?>&view=back"><strong>Back</strong></a> - 
				<a title="click to download design" target="_blank" href="<?php echo $base_url; ?>tshirtecommerce/download_idea.php?key=<?php echo $design[0].':'.$design[1].':'.$design[2].':'.$design[3].':'.$design[4]; ?>&view=left"><strong>Left</strong></a> - 
				<a title="click to download design" target="_blank" href="<?php echo $base_url; ?>tshirtecommerce/download_idea.php?key=<?php echo $design[0].':'.$design[1].':'.$design[2].':'.$design[3].':'.$design[4]; ?>&view=right"><strong>Right</strong></a>
				</p>
				<?php }} ?>
				 
				<?php
				// options
				if (isset($design->options) && $design->options != '[]')
				{
					$design_options = @json_decode( str_replace('&quot;', '"', $design->options) );
				 
				$html = '';
				for($i=0; $i<count($design_options); $i++)
				{ 
				if (is_string($design_options[$i]->value) && $design_options[$i]->value != '')
				{
				$html .= '<dt>'.$design_options[$i]->name.': '.$design_options[$i]->value.'</dt>';
				}
				else if (count($design_options[$i]->value) > 0)
				{
				$html .= '<dt>'.$design_options[$i]->name.': </dt>';
				 
				$html .=  '<dd>';
				foreach ($design_options[$i]->value as $name => $value)
				{
				$html .=  $name.'  -  '.$value. '; ';
				}
				$html .=  '</dd>';
				}
				}
				echo $html;
				}
				 
				// teams
				if (isset($design->teams) && isset($design->teams->name) )
				{
				$teams = json_decode( json_encode($design->teams), true );
				$table = '<table class="table table-bordered">'
				.  '<thead>'
				.  '<tr>'
				.  '<th>Name</th>'
				.  '<th>Number</th>'
				.  '<th>Sizes</th>'
				.  '</tr>'
				.  '</thead>'
				.  '<tbody>';
				 
				for($i=1; $i<=count($teams['name']); $i++ )
				{
				$size = explode('::', $teams['size'][$i]);
				$table .= '<tr>'
				. '<td>'.$teams['name'][$i].'</td>'
				. '<td>'.$teams['number'][$i].'</td>'
				. '<td>'.$size[0].'</td>'
				. '</tr>';
				}
				 
				$table .= '</tbody></table>';
				 
				echo $table;
				}
				 
				// images
				if (isset($design->images))
				{
				$images = json_decode(str_replace('&quot;', '"', $design->images), true);
				 
				if (count($images) > 0)
				{ 
				$img = '';
				foreach($images as $view => $src)
				{
				$img .= '<div class="img-thumbnail" style="margin:2px;">' 
				. '<a target="_blank" href="'.$base_url.'tshirtecommerce/'.$src.'" class="pull-left" title="Click to view design"><img style="width:80px;" src="'.$base_url.'tshirtecommerce/'.$src.'" alt="" title=""></a>' 
				.'</div>';
				}
				 
				echo $img;
				}
				}
				?>
				 
				<?php } ?>


			  <!-- ****************************** suman ****************************** -->
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } ?></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-right"><?php echo $product['quantity']; ?></td>
              <td class="text-right"><?php echo $product['price']; ?></td>
              <td class="text-right"><?php echo $product['total']; ?></td>
              <td class="text-right" style="white-space: nowrap;"><?php if ($product['reorder']) { ?>
                <a href="<?php echo $product['reorder']; ?>" data-toggle="tooltip" title="<?php echo $button_reorder; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></a>
                <?php } ?>
                <a href="<?php echo $product['return']; ?>" data-toggle="tooltip" title="<?php echo $button_return; ?>" class="btn btn-danger"><i class="fa fa-reply"></i></a></td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td class="text-left"><?php echo $voucher['description']; ?></td>
              <td class="text-left"></td>
              <td class="text-right">1</td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <?php if ($products) { ?>
              <td></td>
              <?php } ?>
            </tr>
            <?php } ?>
          </tbody>
          <tfoot>
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td colspan="3"></td>
              <td class="text-right"><b><?php echo $total['title']; ?></b></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
              <?php if ($products) { ?>
              <td></td>
              <?php } ?>
            </tr>
            <?php } ?>
          </tfoot>
        </table>
      </div>
      <?php if ($comment) { ?>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left"><?php echo $text_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-left"><?php echo $comment; ?></td>
          </tr>
        </tbody>
      </table>
      <?php } ?>
      <?php if ($histories) { ?>
      <h3><?php echo $text_history; ?></h3>
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-left"><?php echo $column_date_added; ?></td>
            <td class="text-left"><?php echo $column_status; ?></td>
            <td class="text-left"><?php echo $column_comment; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($histories as $history) { ?>
          <tr>
            <td class="text-left"><?php echo $history['date_added']; ?></td>
            <td class="text-left"><?php echo $history['status']; ?></td>
            <td class="text-left"><?php echo $history['comment']; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>