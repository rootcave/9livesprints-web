/* SHARED VARS */
var touch = false;

function getURLVar(key) {
	var value = [];

	var query = String(document.location).split('?');

	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');

			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}

$(document).ready(function() {
	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();
		
		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});
		$('.selectpicker').selectpicker();//select
	// Currency
	$('#currency .currency-select').on('click', function(e) {
		e.preventDefault();

		$('#currency input[name=\'code\']').attr('value', $(this).attr('name'));

		$('#currency').submit();
	});

	// Language
	$('#language a').on('click', function(e) {
		e.preventDefault();

		$('#language input[name=\'code\']').attr('value', $(this).attr('href'));

		$('#language').submit();
	});

	/* Search */
	$('#search input[name=\'search\']').parent().find('button').on('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';

		var value = $('header input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});

	$('#search input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('header input[name=\'search\']').parent().find('button').trigger('click');
		}
	});
	// Product List
	$('#list-view').click(function() {
		$('#list-view').addClass('active');
		$('#grid-view').removeClass('active');
	});

	// Product Grid
	$('#grid-view').click(function() {
		$('#grid-view').addClass('active');
		$('#list-view').removeClass('active');
	});
  
	if (localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');
	} else {
		$('#grid-view').trigger('click');
	}
	// Menu
	$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();

		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});
	//megamenu mobile
	/*$(".open-panel").click(function(){
		$('.mega-menu').toggleClass('in');
	});*/
	$('.nav-pills li.parent > p').click(function(){

		if ($(this).text() == '+'){
			$('.nav-pills li.parent .dropdown').slideUp(0);
			$('.nav-pills li.parent > p').text('+');
			$(this).parent('li').children('.dropdown').slideDown(300);
			$(this).text('-');
		}else{
			$(this).parent('li').children('.dropdown').slideUp(300);
			$(this).text('+');
		}  
		
	});
	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});

	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});
});

//boss themes add cart
var btadd = {
	'cart': function(product_id,quantity) {
		$.ajax({
			url: 'index.php?route=bossthemes/boss_add/cart/',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			success: function(json) {
				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					addProductNotice(json['title'], json['thumb'], json['success'], 'success');
					$('#cart-total').html(json['total']);
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
					
				}
			}
		});
	},
	'wishlist': function(product_id) {
		$.ajax({
			url: 'index.php?route=bossthemes/boss_add/wishlist/',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				if (json['success']) {
					addProductNotice(json['title'], json['thumb'], json['success'], 'success');
					$('#wishlist-total').html(json['total']);
				}else{
					addProductNotice(json['title'],'', json['info']);
					$('#wishlist-total').html(json['total']);
				}
			}
		});
	},
	'compare': function(product_id) {
		$.ajax({
			url: 'index.php?route=bossthemes/boss_add/compare',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				if (json['success']) {
					addProductNotice(json['title'], json['thumb'], json['success'], 'success');
					$('#compare-total').html(json['total']);
				}
			}
		});
	}
	
};
// Cart add remove functions
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();

				$('#cart > button').button('reset');

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('#cart-total').html(json['total']);

					$('html, body').animate({ scrollTop: 0 }, 'slow');

					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			success: function(json) {
				$('#cart > button').button('reset');

				$('#cart-total').html(json['total']);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			success: function(json) {  
				$('#cart > button').button('reset');
				
				$('#cart-total').html(json['total']);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	}
}
var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				$('#cart-total').html(json['total']);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	}
}

/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();

	$('#modal-agree').remove();

	var element = this;

	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal">';
			html += '  <div class="modal-dialog">';
			html += '    <div class="modal-content">';
			html += '      <div class="modal-header">';
			html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
			html += '      </div>';
			html += '      <div class="modal-body">' + data + '</div>';
			html += '    </div';
			html += '  </div>';
			html += '</div>';

			$('body').append(html);

			$('#modal-agree').modal('show');
		}
	});
});

/* Autocomplete */
(function($) {
	function Autocomplete(element, options) {
		this.element = element;
		this.options = options;
		this.timer = null;
		this.items = new Array();

		$(element).attr('autocomplete', 'off');
		$(element).on('focus', $.proxy(this.focus, this));
		$(element).on('blur', $.proxy(this.blur, this));
		$(element).on('keydown', $.proxy(this.keydown, this));

		$(element).after('<ul class="dropdown-menu"></ul>');
		$(element).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));
	}

	Autocomplete.prototype = {
		focus: function() {
			this.request();
		},
		blur: function() {
			setTimeout(function(object) {
				object.hide();
			}, 200, this);
		},
		click: function(event) {
			event.preventDefault();

			value = $(event.target).parent().attr('data-value');

			if (value && this.items[value]) {
				this.options.select(this.items[value]);
			}
		},
		keydown: function(event) {
			switch(event.keyCode) {
				case 27: // escape
					this.hide();
					break;
				default:
					this.request();
					break;
			}
		},
		show: function() {
			var pos = $(this.element).position();

			$(this.element).siblings('ul.dropdown-menu').css({
				top: pos.top + $(this.element).outerHeight(),
				left: pos.left
			});

			$(this.element).siblings('ul.dropdown-menu').show();
		},
		hide: function() {
			$(this.element).siblings('ul.dropdown-menu').hide();
		},
		request: function() {
			clearTimeout(this.timer);

			this.timer = setTimeout(function(object) {
				object.options.source($(object.element).val(), $.proxy(object.response, object));
			}, 200, this);
		},
		response: function(json) {
			html = '';

			if (json.length) {
				for (i = 0; i < json.length; i++) {
					this.items[json[i]['value']] = json[i];
				}

				for (i = 0; i < json.length; i++) {
					if (!json[i]['category']) {
						html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
					}
				}

				// Get all the ones with a categories
				var category = new Array();

				for (i = 0; i < json.length; i++) {
					if (json[i]['category']) {
						if (!category[json[i]['category']]) {
							category[json[i]['category']] = new Array();
							category[json[i]['category']]['name'] = json[i]['category'];
							category[json[i]['category']]['item'] = new Array();
						}

						category[json[i]['category']]['item'].push(json[i]);
					}
				}

				for (i in category) {
					html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';

					for (j = 0; j < category[i]['item'].length; j++) {
						html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
					}
				}
			}

			if (html) {
				this.show();
			} else {
				this.hide();
			}

			$(this.element).siblings('ul.dropdown-menu').html(html);
		}
	};

	$.fn.autocomplete = function(option) {
		return this.each(function() {
			var data = $(this).data('autocomplete');

			if (!data) {
				data = new Autocomplete(this, option);

				$(this).data('autocomplete', data);
			}
		});
	}
})(window.jQuery);

function boss_addToCart(product_id) { 
  $.ajax({
      url: 'index.php?route=bossthemes/cart/add',
      type: 'post',
      data: 'product_id=' + product_id,
      dataType: 'json',
      success: function(json) { 
          if (json['redirect']) {
              location = json['redirect'];
          }

          if (json['success']) { 
            addProductNotice(json['title'], json['thumb'], json['success'], 'success');
			//$('#cart-total').html(json['total']);
			//$('#cart_content').load('index.php?route=module/cart #cart_content > *');
			$('#cart-total').html(json['total']);
			$('#cart > ul').load('index.php?route=common/cart/info ul li');
          }
      }
  });
}

function boss_addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=bossthemes/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			if (json['success']) {
				addProductNotice(json['title'], json['thumb'], json['success'], 'success');
				$('#wishlist-total').html(json['total']);
			}
		}
	});
}

function boss_addToCompare(product_id) {
	$.ajax({
		url: 'index.php?route=bossthemes/compare/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			if (json['success']) {
                addProductNotice(json['title'], json['thumb'], json['success'], 'success');
				$('#compare-total').html(json['total']);
			}
		}
	});
}


function addProductNotice(title, thumb, text, type) {
	$.jGrowl.defaults.closer = true;
	var tpl = thumb + '<h3>'+text+'</h3>';
	$.jGrowl(tpl, {		
		life: 4000,
		header: title,
		speed: 'slow'
	});
}

// handles Animate
function dataAnimate(){
  $('[data-animate]').each(function(){
    
    var $toAnimateElement = $(this);
    
    var toAnimateDelay = $(this).attr('data-delay');
    
    var toAnimateDelayTime = 0;
    
    if( toAnimateDelay ) { toAnimateDelayTime = Number( toAnimateDelay ); } else { toAnimateDelayTime = 200; }
    
    if( !$toAnimateElement.hasClass('animated') ) {
      
      $toAnimateElement.addClass('not-animated');
      
      var elementAnimation = $toAnimateElement.attr('data-animate');
      
      $toAnimateElement.appear(function () {
        
        setTimeout(function() {
          $toAnimateElement.removeClass('not-animated').addClass( elementAnimation + ' animated');
        }, toAnimateDelayTime);
        
      },{accX: 0, accY: -80},'easeInCubic');
      
    }
    
  });
}
   
jQuery(document).ready(function($) {
  
  /* DETECT PLATFORM */
  $.support.touch = 'ontouchend' in document;
  
  if ($.support.touch) {
    touch = true;
    $('body').addClass('touch');
  }
  else{
	$('body').addClass('notouch');
  }
  
  /* Handle Animate */
  if(touch == false){
    dataAnimate();
  }
  
	
	
});

// Js smartresize
(function($,sr){
  // debouncing function from John Hann
  // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
  var debounce = function (func, threshold, execAsap) {
      var timeout;

      return function debounced () {
          var obj = this, args = arguments;
          function delayed () {
              if (!execAsap)
                  func.apply(obj, args);
              timeout = null; 
          };

          if (timeout)
              clearTimeout(timeout);
          else if (execAsap)
              func.apply(obj, args);

          timeout = setTimeout(delayed, threshold || 100); 
      };
  }
// smartresize 
 jQuery.fn[sr] = function(fn){  return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };

})(jQuery,'smartresize');

var TO = false;
$(window).smartresize(function(){
if(TO !== false)
    clearTimeout(TO);
 TO = setTimeout(resizeWidth, 400); //400 is time in miliseconds
});

function handleMenu(){
  // Listener for header
  var scrollTop = $(this).scrollTop();
  var heightHeader = $('#header').outerHeight();
  var heightNav = $('#bt_menu').outerHeight();
  var heighttotal = (heightHeader+heightNav);
  
  if(getWidthBrowser() > 1024){
    if(scrollTop > heighttotal){
      if(!$('#bt_menu').hasClass('show')){
        $('<div style="min-height:'+heightNav+'px"></div>').insertBefore('#bt_menu');
        $('#bt_menu').addClass('show').addClass('fadeInDown animated');
      }
    }else{
      if($('#bt_menu').hasClass('show')){
        $('#bt_menu').prev().remove();
        $('#bt_menu').removeClass('show').removeClass('fadeInDown animated');
      }
    }
  }
};
$(window).load(function(){
	resizeWidth();
});
function resizeWidth(){
	var currentWidth = $("#bt_mainmenu").outerWidth();	
	$('.mega-menu ul > li.parent > div').each(function(index, element) {		
		var menu = $('#bt_mainmenu').offset();
		var dropdown = $(this).parent().offset();
		i = (dropdown.left + $(this).outerWidth()) - (menu.left + currentWidth);
		if (i > 0) {
			$(this).css('margin-left', '-' + (i)+ 'px');
		}
		else
			$(this).css('margin-left', '0px');
	});
}