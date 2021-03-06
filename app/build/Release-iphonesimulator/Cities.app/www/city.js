(function($){
	$.fn.extend({
		writeStories : function(opts) {
			if (! opts) { var opts = {}; }
			return this.each(function() {
				var container = $(this);
				var stories = city[$(this).attr('id')];
				var story = '';
				$(stories).each(function(){
					story += '\
						<div class="story">\
							<h3>'+this.title+'</h3>\
							<p id="city'+this.title+'">'+this.excerpt+'</p>\
						</div>';

					if (opts && opts.append) {
						story += opts.append;
					}
				});		
				container.prepend(story);
				//					$('#upcomingStories').writeStores();
			});
		},
		
		writeText : function() {
			return this.each(function(){
				var text = city[$(this).attr('id')];
				
				
				
				if (text) {
					var cssHeight = null;
					if ($(this).height()) {cssHeight = $(this).height; }
					$(this).prepend(text);
				}
			});
		},
		
		slideshow : function(images) {
			return this.each(function(){
				var count = 0;
				var slideshow = $(this);
				var loaded = false;
				var rotateSpeed = 3200;
				var fadeSpeed = 700;
				
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
						img.css({marginTop: "-"+Math.round(ImgHeight/2)+"px", marginLeft: "-"+Math.round(ImgWidth/2)+"px"});					img.hide();
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
		}
	})
})(jQuery);