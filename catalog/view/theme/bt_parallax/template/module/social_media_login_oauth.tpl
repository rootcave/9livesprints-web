<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<script type="text/javascript" src="catalog/view/javascript/social_media_login/jquery-1.7.1.min.js"></script>
		<script>
			var ocsml_params = {
				success: <?php echo json_encode($success); ?>,
				ajaxurl: <?php echo json_encode($ajaxurl); ?>,
				redirect: <?php echo json_encode($redirect); ?>,
				message: <?php echo json_encode($message); ?>
			};
		</script>
		<script type="text/javascript" src="catalog/view/javascript/social_media_login/sml.js"></script>
		<style>
			.alert {
				padding: 15px;
				margin-bottom: 20px;
				border: 1px solid transparent;
				border-radius: 4px;
				-webkit-box-sizing: border-box;
				-moz-box-sizing: border-box;
				box-sizing: border-box;
				font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
				font-size: 14px;
				line-height: 1.42857143;
				color: #333;
				margin-top: 35px;
			}
			.message {
				color: #31708f;
				background-color: #d9edf7;
				border-color: #bce8f1;
			}
			.success {
				color: #3c763d;
				background-color: #dff0d8;
				border-color: #d6e9c6;
			}
			.error {
				color: #a94442;
				background-color: #f2dede;
				border-color: #ebccd1;
			}
			.busy {
				background-image: url('catalog/view/javascript/social_media_login/g.gif');
				background-repeat: no-repeat;
				background-position: 15px center;
				padding-left: 35px;
			}
		</style>
	</head>
	<body>
		<div class="alert message <?php echo !empty($error) ? 'error' : 'busy'; ?>">
			<?php echo $message; ?>
		</div>
	</body>
</html>