var city = {
	loadPage : function(item) {
	},
	loadFlickr : function() {
		$.getJSON("http://api.flickr.com/services/feeds/groups_pool.gne?id=675729@N22&lang=en-us&format=json&jsoncallback=?", function(data){
		  $.each(data.items, function(i,item){
		    $("<img/>").attr("src", item.media.m).appendTo("#images")
		      .wrap("<a href='" + item.link + "'></a>");
		  });
		});
	}
	
};
$.fn.extend({
		writeStories : function(opts) {
			if (! opts) { var opts = {}; }
			return this.each(function() {
				var container = $(this);
				var stories = city.data[$(this).attr('id')];
				var story = '';
				$(stories).each(function(){
					var story = this;
					var a = $('<a />');
					a.attr('href','javascript:;');
					a.html('<h3>'+this.title+'</h3><p id="city'+this.title+'">'+this.excerpt+'</p>');
					var storyDiv = $('<div />');
					storyDiv.addClass('story');
					storyDiv.append(a);
					
					container.prepend(storyDiv);
					if (opts && opts.append) {
						storyDiv.after(opts.append);
					}
					
					a.click(function(e){
						e.preventDefault();
						city.loadPage(story);
					});
						
				});		
				
				//					$('#upcomingStories').writeStores();
			});
		},
		
		writeText : function() {
			return this.each(function(){
				var text = city.data[$(this).attr('id')];
				
				
				
				if (text) {
					var cssHeight = null;
					if ($(this).height()) {cssHeight = $(this).height; }
					$(this).prepend(text);
				}
			});
		},
		
		dropCap : function() {
			return this.each(function(){
				var el = $($(this).find('*')[0]);
				el.html('<span class="dropCap">'+el.html().substring(0,1)+'</span>'+el.html().substring(1));
			});
		},
		
		slideshow : function() {
			var images = city.data.slideshow;
			if (images && images.length) {
				return this.each(function(){

					var count = 0;
					var slideshow = $(this);
					var loaded = false;
					var rotateSpeed = 3500;
					var fadeSpeed = 600;
				
					images.sort(function() { return 0.5 - Math.random(); });

					var rotate = function() {
						if (images.length <= count) {
							count = 0;
						}								
						if (typeof(images[count])=='string') {
							var Img = new Image();		
							Img.src = images[count];
							ImgHeight = Img.height;
							ImgWidth = (Img.width) ? Img.width : 500 ;	
						
							var img = $('<img />');
							if (ImgHeight > slideshow.height() || ImgWidth > slideshow.width() ) {
								var ratio = slideshow.height() / ImgHeight;
								ImgHeight = ImgHeight * ratio;
								ImgWidth = ImgWidth * ratio;
							}	
							img.css({width: ImgWidth, height: ImgHeight });
							
							img.attr('src',images[count]);
							img.css({marginTop: "-"+Math.round(ImgHeight/2)+"px", marginLeft: "-"+Math.round(ImgWidth/2)+"px"});					
							img.hide();
							slideshow.append(img);								
							images[count] = img;
						} else {
							var img = images[count];
						}
						slideshow.find('img:visible').fadeOut(fadeSpeed);
						img.fadeIn(fadeSpeed);								
						count++;
					}
					for (var i in images) {
						$('<img />').attr('src', images[i]).load(function(){	
							if (! loaded) {
								loaded = true;
								rotate();
								var rotateTimer = setInterval(rotate,rotateSpeed);
							}
					    });
					
					};

				});
			} else { return this; }				
		}
});

function run(data) {
	city.data = data;
	
	
	
	//cityTitle = cityTitle.replace(' ','_');

	//$.getScript('city_data/data.js', function() {

		
		/*
		$('#title').writeText();

		$('#slideshow').slideshow();

		$('#introduction').writeText().dropCap();
	
		
		$('#articles').writeStories({append:'<hr />'});
		$('#sections').writeStories();
*/

	//});

}

run('New York, New York');