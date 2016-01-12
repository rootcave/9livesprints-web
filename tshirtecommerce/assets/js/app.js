var app = {
	admin:{
		ini: function(){
			jQuery('#designer-products .modal-body a.modal-link').click(function(){
				var link = jQuery(this).attr('href');
				if(jQuery(this).hasClass('add-link'))
					app.admin.add(this);
				else
					app.admin.load(link);
				return false;
			});
		},
		product: function(e, index){
			if (document.getElementById('designer-products') == null)
			{
				var div = '<div class="modal fade" id="designer-products" tabindex="-1" role="dialog" style="z-index:10520;" aria-labelledby="myModalLabel" aria-hidden="true">'
						+ '<div class="modal-dialog modal-lg" style="width: 95%;">'
						+ 	'<div class="modal-content">'
						+		'<div class="modal-header">'
						+			'<button type="button" data-dismiss="modal" class="close close-list-design">'
						+				'<span aria-hidden="true">×</span>'
						+				'<span class="sr-only">Close</span>'
						+			'</button>'
						+		'</div>'
						+ 		'<div class="modal-body">'
						+		'&#65279;<center><h3>Please wait some time. loading...</h3></center>'
						+		'</div>'
						+	'</div>'
						+ '</div></div>';
				jQuery('body').append(div);
			}
			jQuery('#designer-products').modal('show');			
			var key = e.getAttribute('key');			
			var data = {};
			data.key	= key;
			data.action = 'designer_action';
			
			if (index == 0)
				var url = tshirtURL + 'admin-blank.php';
			else if (index == 2)
				var url = tshirtURL + 'admin-users.php';
			else
				var url = tshirtURL + 'admin.php';
			jQuery.post(url, data, function(response) {		
				jQuery('#designer-products .modal-body').html(response);
				app.admin.ini();
			});
			return false; 
		},
		load: function(link)
		{
			var data = {};
			data.key	= '1';
			data.action = 'designer_action';
			data.link = link;
			jQuery('#designer-products .modal-body').html('&#65279;<center><h3>Please wait some time. loading...</h3></center>');
			jQuery.post(ajaxurl, data, function(response) {
				jQuery('#designer-products .modal-body').html(response);				
				app.admin.ini();
			});
			return false; 
		},
		add: function(e)
		{
			var id = jQuery(e).data('id');
			var title = jQuery(e).data('title');
			var img = jQuery(e).children('img').attr('src');
			document.getElementById('_product_id').value = id;
			
			var price = document.getElementById('design_print_price').value;
			
			document.getElementById('_product_title_img').value = title +'::'+ img +'::'+ price;
			
			var html = '<img src="'+img+'" class="img-responsive img-thumbnail" alt="'+title+'">';
			html = html + '<br /><center>'+title+'</center>';
			
			jQuery('#add_designer_product').html(html);
			
			jQuery('#designer-products').modal('hide');
		},
		clear: function(){
			var check = confirm('You sure want clear this product?');
			if (check == true)
			{
				document.getElementById('_product_id').value = '';
				document.getElementById('_product_title_img').value = '';
				document.getElementById('design_print_price').value = 0;
				jQuery('#add_designer_product').html('');
			}
		}
	},
	cart: function(content){
		
		var data = {			
			product_id: content.product_id,
			quantity: content.quantity,
			design: content,
		};
		
		jQuery.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: data,
			dataType: 'json',
			success: function (json) {
				window.location.href = 'index.php?route=checkout/cart';
			}
		});		
	}
}

function setHeigh(height){
	height = height + 10;
	document.getElementById('tshirtecommerce-designer').setAttribute('height', height + 'px');
}

function setupPrice(e)
{
	var price = e.value;
	var img = document.getElementById('_product_title_img').value;
	var product_id = document.getElementById('_product_id').value;
	if (product_id == '' || img == '')
	{
		alert('Please choose product design.');
		return false;
	}
	
	var params = img.split('::');
	if (typeof params[1] == 'undefined')
		params[1] = '';
	
	params[2] = price;
	
	img = params[0] +'::'+ params[1] +'::'+ params[2];
	document.getElementById('_product_title_img').value = img;
}

function viewBoxdesign(){
	var width = jQuery(document).width();
	var height = jQuery(document).height();
	if (width < 700 || height < 600)
	{
		var url = urlDesignload.replace('index.php', 'mobile.php');
		jQuery('body').append('<div id="modal-design-bg"></div><div id="modal-designer"><a href="'+urlBack+'" class="btn btn-dange btn-xs">Close</a><iframe id="tshirtecommerce-designer" scrolling="no" frameborder="0" width="100%" height="100%" src="'+url+'"></iframe></div>');
	}
	else
	{
		jQuery('.row-designer').html('<iframe id="tshirtecommerce-designer" scrolling="no" frameborder="0" noresize="noresize" width="100%" height="100%" src="'+urlDesignload+'"></iframe>');
	}
}
jQuery(document).ready(function(){
	if (jQuery('.row-designer').length > 0)
	{
		viewBoxdesign();
	}
});