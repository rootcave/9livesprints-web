<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-social-media-login" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if (!empty($error)) { ?>
		<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <b>Validation Errors</b><br/>
			<?php echo $error; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>

		<?php if (!empty($success)) { ?>
		<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-cog"></i> <?php echo $text_settings; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-social-media-login" class="form-horizontal">
					<h4>Module Status <hr /></h4>
					<label style="font-size: 14px;">
						<input type="checkbox" name="social_media_login_status" value="1" <?php echo $module->form_value('status', 1, 'checkbox'); ?> />
							   <?php echo $text_enabled; ?>
					</label>

					<p>&nbsp;</p>
					<h4>Module Login Providers <hr /></h4>
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#facebook" aria-controls="home" role="tab" data-toggle="tab">Facebook</a></li>
						<li role="presentation"><a href="#google" aria-controls="profile" role="tab" data-toggle="tab">Google</a></li>
						<li role="presentation"><a href="#yahoo" aria-controls="messages" role="tab" data-toggle="tab">Yahoo</a></li>
						<li role="presentation"><a href="#twitter" aria-controls="settings" role="tab" data-toggle="tab">Twitter</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="facebook">
							<p><i class="fa fa-info-circle"></i> <i><?php echo $form_fb_hint_app; ?></i></p>
							<br />
							<div class="form-group">
								<label class="control-label col-sm-2"><?php echo $form_fb_app_id; ?>:</label>
								<div class="col-sm-10">
									<input class="form-control" name="social_media_login_fb_app_id" value="<?php echo $module->form_value('fb_app_id'); ?>" placeholder="<?php echo $form_fb_app_id; ?>">
									<span class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2"><?php echo $form_fb_app_secret; ?>:</label>
								<div class="col-sm-10">
									<input class="form-control" name="social_media_login_fb_app_secret" value="<?php echo $module->form_value('fb_app_secret'); ?>" placeholder="<?php echo $form_fb_app_secret; ?>">
								</div>
							</div>
							<?php foreach ($languages as $language): ?>
								<div class="form-group has-feedback">
									<label class="control-label col-sm-2"><?php echo $form_fb_button_name; ?>:</label>
									<div class="col-sm-10">
										<input class="form-control" name="social_media_login_fb_button_name_<?php echo $language['language_id']; ?>" value="<?php echo $module->form_value('fb_button_name_' . $language['language_id'], 'Login with Facebook'); ?>">
										<span class="form-control-feedback">
											<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
										</span>
									</div>
								</div>
							<?php endforeach; ?>
							<div class="form-group"> 
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label><input type="checkbox" name="social_media_login_fb_status" value="1" <?php echo $module->form_value('fb_status', 1, 'checkbox'); ?>> <?php echo $form_fb_status;?></label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2"><?php echo $form_fb_redirect_url; ?>:</label>
								<div class="col-sm-10">
									<p class="form-control-static well"><?php echo $module->form_value('fb_redirect_url'); ?></p>
									<input type="hidden" name="social_media_login_fb_redirect_url" value="<?php echo $module->form_value('fb_redirect_url'); ?>">
									<span class="help-block"><i><?php echo $form_fb_hint_redirect_url; ?></i></span>
								</div>
							</div>
						</div>

						<div role="tabpanel" class="tab-pane" id="google">
							<p><i class="fa fa-info-circle"></i> <i><?php echo $form_ggl_hint_app; ?></i></p>
							<br />
							<div class="form-group">
								<label class="control-label col-sm-2"><?php echo $form_ggl_client_id; ?>:</label>
								<div class="col-sm-10">
									<input class="form-control" name="social_media_login_ggl_client_id" value="<?php echo $module->form_value('ggl_client_id'); ?>" placeholder="<?php echo $form_ggl_client_id; ?>">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2"><?php echo $form_ggl_client_secret; ?>:</label>
								<div class="col-sm-10">
									<input class="form-control" name="social_media_login_ggl_client_secret" value="<?php echo $module->form_value('ggl_client_secret'); ?>" placeholder="<?php echo $form_ggl_client_secret; ?>">
								</div>
							</div>
							<?php foreach ($languages as $language): ?>
								<div class="form-group has-feedback">
									<label class="control-label col-sm-2"><?php echo $form_ggl_button_name; ?>:</label>
									<div class="col-sm-10">
										<input class="form-control" name="social_media_login_ggl_button_name_<?php echo $language['language_id']; ?>" value="<?php echo $module->form_value('ggl_button_name_' . $language['language_id'], 'Login with Google'); ?>">
										<span class="form-control-feedback">
											<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
										</span>
									</div>
								</div>
							<?php endforeach; ?>
							<div class="form-group"> 
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label><input type="checkbox" name="social_media_login_ggl_status" value="1" <?php echo $module->form_value('ggl_status', 1, 'checkbox'); ?>> <?php echo $form_ggl_status;?></label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2"><?php echo $form_ggl_redirect_url; ?>:</label>
								<div class="col-sm-10">
									<p class="form-control-static well"><?php echo $module->form_value('ggl_redirect_url'); ?></p>
									<input type="hidden" name="social_media_login_ggl_redirect_url" value="<?php echo $module->form_value('ggl_redirect_url'); ?>">
									<span class="help-block"><i><?php echo $form_ggl_hint_redirect_url; ?></i></span>
								</div>
							</div>
						</div>

						<div role="tabpanel" class="tab-pane" id="yahoo">
							<p><i class="fa fa-info-circle"></i> <i><?php echo $form_yao_hint_app; ?></i></p>
							<br />
							<div class="form-group">
								<label class="control-label col-sm-2"><?php echo $form_yao_consumer_key; ?>:</label>
								<div class="col-sm-10">
									<input class="form-control" name="social_media_login_yao_consumer_key" value="<?php echo $module->form_value('yao_consumer_key'); ?>" placeholder="<?php echo $form_yao_consumer_key; ?>">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2"><?php echo $form_yao_consumer_secret; ?>:</label>
								<div class="col-sm-10">
									<input class="form-control" name="social_media_login_yao_consumer_secret" value="<?php echo $module->form_value('yao_consumer_secret'); ?>" placeholder="<?php echo $form_yao_consumer_secret; ?>">
								</div>
							</div>
							<?php foreach ($languages as $language): ?>
								<div class="form-group has-feedback">
									<label class="control-label col-sm-2"><?php echo $form_yao_button_name; ?>:</label>
									<div class="col-sm-10">
										<input class="form-control" name="social_media_login_yao_button_name_<?php echo $language['language_id']; ?>" value="<?php echo $module->form_value('yao_button_name_' . $language['language_id'], 'Login with Yahoo'); ?>">
										<span class="form-control-feedback">
											<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
										</span>
									</div>
								</div>
							<?php endforeach; ?>
							<div class="form-group"> 
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label><input type="checkbox" name="social_media_login_yao_status" value="1" <?php echo $module->form_value('yao_status', 1, 'checkbox'); ?>> <?php echo $form_yao_status;?></label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2"><?php echo $form_yao_redirect_url; ?>:</label>
								<div class="col-sm-10">
									<p class="form-control-static well"><?php echo $module->form_value('yao_redirect_url'); ?></p>
									<input type="hidden" name="social_media_login_yao_redirect_url" value="<?php echo $module->form_value('yao_redirect_url'); ?>">
									<span class="help-block"><i><?php echo $form_yao_hint_redirect_url; ?></i></span>
								</div>
							</div>
						</div>

						<div role="tabpanel" class="tab-pane" id="twitter">
							<p><i class="fa fa-info-circle"></i> <i><?php echo $form_twt_hint_app; ?></i></p>
							<br />
							<div class="form-group">
								<label class="control-label col-sm-2"><?php echo $form_twt_consumer_key; ?>:</label>
								<div class="col-sm-10">
									<input class="form-control" name="social_media_login_twt_consumer_key" value="<?php echo $module->form_value('twt_consumer_key'); ?>" placeholder="<?php echo $form_twt_consumer_key; ?>">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2"><?php echo $form_twt_consumer_secret; ?>:</label>
								<div class="col-sm-10">
									<input class="form-control" name="social_media_login_twt_consumer_secret" value="<?php echo $module->form_value('twt_consumer_secret'); ?>" placeholder="<?php echo $form_twt_consumer_secret; ?>">
								</div>
							</div>
							<?php foreach ($languages as $language): ?>
								<div class="form-group has-feedback">
									<label class="control-label col-sm-2"><?php echo $form_twt_button_name; ?>:</label>
									<div class="col-sm-10">
										<input class="form-control" name="social_media_login_twt_button_name_<?php echo $language['language_id']; ?>" value="<?php echo $module->form_value('twt_button_name_' . $language['language_id'], 'Login with Twitter'); ?>">
										<span class="form-control-feedback">
											<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
										</span>
									</div>
								</div>
							<?php endforeach; ?>
							<div class="form-group"> 
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label><input type="checkbox" name="social_media_login_twt_status" value="1" <?php echo $module->form_value('twt_status', 1, 'checkbox'); ?>> <?php echo $form_twt_status;?></label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2"><?php echo $form_twt_redirect_url; ?>:</label>
								<div class="col-sm-10">
									<p class="form-control-static well"><?php echo $module->form_value('twt_redirect_url'); ?></p>
									<input type="hidden" name="social_media_login_twt_redirect_url" value="<?php echo $module->form_value('twt_redirect_url'); ?>">
									<span class="help-block"><i><?php echo $form_twt_hint_redirect_url; ?></i></span>
								</div>
							</div>
						</div>

					</div>

					<p>&nbsp;</p>

				</form>
			</div>
		</div>
	</div>
</div>

<style>
	.well {padding: 2px 13px;}
</style>

<?php echo $footer; ?>