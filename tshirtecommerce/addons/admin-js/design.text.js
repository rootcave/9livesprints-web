jQuery(document).ready(function(){
	jQuery( "#text-arc" ).slider({
		min: 0,
		max: 360,
		value: 0,
		range: "min",
		slide: function( event, ui ) {
			if(jQuery('.text-arc-reverse').is(':checked'))
			{
				var txt = '-' + ui.value;
			}
			else
			{
				var txt = ui.value;
			}
			if (txt == '-0') txt = '0'
			jQuery('#text-arc-value').html(txt);
			design.text.arc.setup(txt);
		}		
	});
});

jQuery(document).on('before.add.text.design', function(event, txt){
	jQuery( "#text-arc" ).slider({value: 0});
	jQuery('.text-arc-reverse').prop('checked', false);
});

jQuery(document).on('update.text.design', function(event, lable, value){
	if (value != '')
	{
		var elm = design.item.get();
		var value = elm.data('textCurve');
		if (typeof value == 'undefined' || value == 0)
		{
			var text = elm.find('text');
			text[0].setAttributeNS(null, 'x', '27');
			text[0].setAttributeNS(null, 'y', '20');
		}
		else
		{
			design.text.arc.setup(value);
		}
	}
});

jQuery(document).on('after.add.text.design', function(event, item){
	var elm = design.item.get();	
	elm.data('textCurve', 0);
	elm.data('itemZoom', '1 1');
});

// setup value zoom of item
jQuery(document).on('resize.item.design', function(event, ui){
	var elm = design.item.get();
	var type = elm.data('type');
	if (type == 'text')
	{
		var svg = elm.find('svg');
		var viewBox 	= svg[0].getAttributeNS(null, 'viewBox');
		var params 		= viewBox.split(' ');
		var width 		= svg[0].getAttributeNS(null, 'width');
		var height 		= svg[0].getAttributeNS(null, 'height');
		
		elm.data('itemZoom', (params[2]/width) +' '+ (params[3]/height));
	}
});


// update item when select
jQuery(document).on('select.item.design', function(event, e){
	if (jQuery(e).data('type') != 'text') return;
	
	var value = jQuery(e).data('textCurve');
	
	if (typeof value == 'undefined' || value == 0)
	{
		jQuery('.text-arc-reverse').prop('checked', false);
		jQuery( "#text-arc" ).slider({value: 0});
	}
	else
	{
		if (value > 0)
		{
			jQuery('.text-arc-reverse').prop('checked', false);
			jQuery( "#text-arc" ).slider({value: value});
		}
		else
		{
			jQuery('.text-arc-reverse').prop('checked', true);
			jQuery( "#text-arc" ).slider({value: value*-1});
		}
		
	}
	jQuery('#text-arc-value').html(value);
});

function textCircle(text, x, y, radius, space, top){
   space = space || 0;
   var numRadsPerLetter = (Math.PI - space * 2) / text.length;
   ctx.save();
   ctx.translate(x,y);
   var k = (top) ? 1 : -1; 
   ctx.rotate(-k * ((Math.PI - numRadsPerLetter) / 2 - space));
   for(var i=0;i<text.length;i++){
      ctx.save();
      ctx.rotate(k*i*(numRadsPerLetter));
      ctx.textAlign = "center";
     ctx.textBaseline = (!top) ? "top" : "bottom";
     ctx.fillText(text[i],0,-k*(radius));
     ctx.restore();	  
   }
   ctx.restore();   
}


function textPathcanvas(item, context, callback, obj, i){
	var images 	= new Image();
	images.onload = function() {
		context.drawImage(images, item.left, item.top, item.width, item.height);
		context.restore();							
		callback(obj, i);
	};						
	images.src = "data:image/svg+xml;base64," + b64EncodeUnicode(item.svg);
};

design.text.arc = {
	reverse: function(e){
		var value = jQuery('#text-arc-value').html();
		value = value.replace('-', '');		
		if (jQuery(e).is(':checked'))
		{
			var i = -1;
			if (value == '0')
				jQuery('#text-arc-value').html(value);
			else
				jQuery('#text-arc-value').html('-'+value);
		}
		else
		{
			var i = 1;
			jQuery('#text-arc-value').html(value);
		}
		design.text.arc.setup(value*i);
	},
	setup: function(deg){
		var elm = design.item.get();
		
		var rotate = elm.data('rotate');
		if (rotate == 'undefined') rotate = 0;		
		elm.css('transform', 'rotate(0rad)');
		elm.data('rotate', 0);
							
		// add data to elem
		elm.data('textCurve', deg);
		
		if (elm.length > 0)
		{
			elm.find('defs').remove();
			design.text.update('text', '');
			
			var svg = elm.children('svg');
			
			var elm_text = jQuery(svg[0]).find('text');
			elm_text[0].setAttributeNS(null, 'x', '');
			elm_text[0].setAttributeNS(null, 'y', '');
			elm_text[0].setAttributeNS(null, 'text-anchor', 'start');
			
			var viewBox = svg[0].getAttributeNS(null, 'viewBox');
			var params = viewBox.split(' ');
			
			if (params[2] > 0)
				svg[0].setAttributeNS(null, 'width', params[2]);
			if (params[3] > 0)
				svg[0].setAttributeNS(null, 'height', params[3]);
			
			var text = jQuery('#enter-text').val();	
			if (deg != 0)
			{
				var size = jQuery(svg[0]).textArc(text, deg);
			
				var itemZoom = elm.data('itemZoom');
				var zoom = itemZoom.split(' ');
				var width = size.width/zoom[0];
				var height = size.height/zoom[1];
				
				jQuery('.drag-item.drag-item-selected').css({'width':width+'px', 'height':height+'px'});
				var svg = jQuery('.drag-item.drag-item-selected').find('svg');
				svg[0].setAttributeNS(null, 'width', width);
				svg[0].setAttributeNS(null, 'height', height);
			}
			
			jQuery(document).triggerHandler( "size.update.text.design", [width, height]);
			
			if (deg == '0')
			{				
				elm.find('defs').remove();
				
				var elm_text = jQuery(svg[0]).find('text');
				var text = elm_text[0];
				text.setAttributeNS(null, 'x', '27');
				text.setAttributeNS(null, 'y', '20');
				text.setAttributeNS(null, 'text-anchor', 'middle');
				var txt = jQuery('#enter-text').val();
				jQuery(text).html('<tspan dy="0" x="50%">'+txt+'</tspan>');
				design.text.update('text', '');
			}			
		}
		
		elm.data('rotate', rotate);
		rotate = rotate * Math.PI / 180;
		elm.css('transform', 'rotate('+rotate+'rad)');
	}
}

