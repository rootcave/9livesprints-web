<script type="text/javascript" src="catalog/view/javascript/social_media_login/sml.js"></script>
<ul id="opencart-sml">
<?php if ($fb_enabled && !$customer_logged): ?>
	<li>
	  <a class="opencart-sml facebook" data-is="facebook" href="<?php echo $fb_adapter_url; ?>"><?php echo $fb_button_name; ?></a>
	</li>
<?php endif; // end $fb_enabled ?>

<?php if ($twt_enabled && !$customer_logged): ?>
	<li style="margin-top:0px;">
	  <a class="opencart-sml twitter" data-is="twitter" href="<?php echo $twt_adapter_url; ?>"><?php echo $twt_button_name; ?></a>
	</li>
<?php endif; // end $twt_enabled ?>

<?php if ($ggl_enabled && !$customer_logged): ?>
	<li style="margin-top:0px;">
	  <a class="opencart-sml google" data-is="google" href="<?php echo $ggl_adapter_url; ?>" data-height="600"><?php echo $ggl_button_name; ?></a>
	</li>
<?php endif; // end $ggl_enabled ?>

<?php if ($yao_enabled && !$customer_logged): ?>
	<li style="margin-top:0px;">
	  <a class="opencart-sml yahoo" data-is="yahoo" href="<?php echo $yao_adapter_url; ?>" data-height="500"><?php echo $yao_button_name; ?></a>
	</li>
<?php endif; // end $ggl_enabled ?>
</ul>
<div style="clear: both;"></div>
<style>
	#opencart-sml {
		padding: 0;
		margin: 0;
		list-style: none;
		clear: both;
	}
	#opencart-sml li{
		list-style: none;
		display: inline-block;
		float: left;
		margin-right: 10px;
	}
	.opencart-sml {
		padding: 5px;
		margin-top: 10px;
		display: block;
		font-weight: bold;
		height: 34px;
		line-height: 34px;
		padding: 0 15px 0 15px;
		border-radius: 3px;
		text-align: center;
		text-decoration: none;
		color: #fff !important;
		width: 153px;
		min-width: 150px;
		font-weight: normal;
	}
	.opencart-sml.facebook {
		background: #3b5998;
	}
	.opencart-sml.twitter {
		background: #00aced;
	}
	.opencart-sml.google {
		background: #ff3c1f;
	}
	.opencart-sml.yahoo {
		background: #6a026e;
	}
</style>