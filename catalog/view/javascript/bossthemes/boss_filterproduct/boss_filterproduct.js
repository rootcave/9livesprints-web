function checkDevices($module){
	if(getWidthBrowser() > 767){
		$('.content_tabs'+$module).show();
		
	}
	else {
		//$('.content_tabs'+$module).hide();
		
		var $tabs = $(".head_tabs");
		$tabs.each(function() {
		
			//  Here we get the active element
			var parent = $(this).parent();
			if($(parent).hasClass('active')){
				
				var href = $(parent).find("a").attr("href");
				$(href).show();
				//break;
			}
		});
	}
}

function execCarousel($carousel,$limit,$width,$height) {
	
	$($carousel).carouFredSel({
		responsive: true,
		width: '100%',
		/*height: 'auto',*/
		prev: $($carousel).attr("data-prev"),
		next: $($carousel).attr("data-next"),
		auto: false,
		swipe: {
				onTouch : true
			},
		items: {
				width: $width,
				height: 'auto',
				visible: {
					min: 1,
					max: $limit
				}
			},
		scroll: {
				direction : 'left',    //  The direction of the transition.
				duration  : 900,   //  The duration of the transition.
				onBefore: function(){
				  /*if(touch == false){
					var that = $($carousel);
					var items = that.find('.not-animated');
					items.removeClass('not-animated').unbind('appear');
					
					items = that.find('.animated');
					items.removeClass('animated').unbind('appear');
				  }*/
				}
			}
	});
}

function initCarousel($use_tab,$module,$use_scrolling_panel,$limit,$width){
	if(!$use_tab) {
		
		//	Only init the carousel for the content in actived tab, because after click the tab, we will init it again
		var $tabs = $('.head_tabs'+$module);
		if($use_scrolling_panel) {
			$tabs.each(function() {
			
				//  Here we get the data-crs(carousel) value of the selected tab
				var $carousel = $(this).attr("data-crs");

				//	Here we call function "execCarousel"
				execCarousel($carousel,$limit,$width);
				
			});
		}
	} else { 
		//	Only init the carousel for the content in actived tab, because after click the tab, we will init it again
		var $tabs = $("#tabs"+$module+" li.active").first();
		
		if ($use_scrolling_panel) {
		//  Here we get the data-crs(carousel) value of the selected tab
		var $carousel = $($tabs).find("a").attr("data-crs");
		//	Here we call function "execCarousel"
		execCarousel($carousel,$limit,$width);
		}
	} 
}