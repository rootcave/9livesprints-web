(function($, app, undefined) {

	var str_replace = function(string, params) {
		for (var i in params) {
			var t = "\{" + i + "\}";
			string = string.replace((new RegExp(t, 'g')), params[i]);
		}
		return string;
	};

	app.init = function() {
		$('.opencart-sml').bind('click', app.login);
		app.parseOAuth2();
	};

	app.location = function(url) {
		document.location = url;
	};

	app.popup = function(url, provider, width, height) {
		width = width || 400;
		height = height || 300;
		var left = (screen.width / 2) - (width / 2);
		var top = (screen.height / 2) - (height / 2);
		var paramsTpl = 'height={height},width={width},left={left},top={top},resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes';
		var params = str_replace(paramsTpl, {
			width: width,
			height: height,
			left: left,
			top: top
		});
		window.open(url, 'osid_' + provider, params);
	};

	app.login = function(event) {
		event.preventDefault();
		var $this = $(this);
		app.popup($this.attr('href'), $this.attr('is'), $this.data('width'), $this.data('height'));
		return false;
	};

	app.parseOAuth2 = function() {
		var params = window.ocsml_params || {};
		console.log(params);
		if (params.ajaxurl) {
			var $alert = $('.alert');
			$.ajax({
				type: 'GET',
				url: params.ajaxurl
			}).done(function(response) {
				$alert.text(response.message);
				if (response.success) {
					$alert.removeClass('busy error').addClass('success');
					app.redirect(response.redirect);
				} else {
					$alert.removeClass('busy success').addClass('error');
				}
			});
		} else if (params.redirect) {
			app.redirect(params.redirect);
		}
	};

	app.redirect = function(url) {
		if (window.opener) {
			window.opener.location = url;
			window.close();
		} else {
			document.location = url;
		}
	};

	$(document).ready(function() {
		if (!window.osidInitialized) {
			window.osidInitialized = true;
			app.init();
		}
	});

}(jQuery, window.ocsml = window.ocsml || {}));