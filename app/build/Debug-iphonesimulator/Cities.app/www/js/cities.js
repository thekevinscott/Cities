


var articles = function() {
	return {
		yo: 'yos'
	}
}();

var feeds = function() {
	var latitude = "40.7143528";
	var longitude = "-74.0059731";
	var radius = "25km";
	var limit = 2;
	
	var feed = {};
	var feedCount = 0;
	
	// pull twitter
	var twitter = $.getJSON("http://search.twitter.com/search.json?geocode="+latitude+","+longitude+","+radius+"&language=english&callback=?", function(data){
		if (data && data.results) {
			cities.feed.updateFeedData('twitter',data.results);
			
		}
	});
	
	var flickrkey = 'e4ed6a6662d84096dcf7a555ce8e5b0d';
	var flickr = $.getJSON("http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key="+flickrkey+"&has_geo=1&lat="+latitude+"&lon="+longitude+"&radius=20&radius_units=mi&format=json&extras=url_sq,url_t,url_s,url_m,url_o,date_upload&sort=date-posted-desc&min_upload_date=0&per_page="+limit+"&jsoncallback=?",function(data){
		if (data && data.photos && data.photos.photo) {
			cities.feed.updateFeedData('flickr',data.photos.photo);
			
			
		}
	});
	
	var youtubeURL = "http://gdata.youtube.com/feeds/api/videos?callback=?&alt=json&format=6&orderby=published&v=2&max-results="+limit+"&location="+latitude+","+longitude+"&location-radius="+radius;
	var youtube = $.getJSON(youtubeURL,function(data){
		if (data && data.feed && data.feed.entry) {
			cities.feed.updateFeedData('youtube',data.feed.entry);
			
		}
	});
	
	var parseFeed = function(feed) {
		
		var newFeed = {
		  keys : new Array(),
		  hash : new Object(),
		  set : function(key, value) {

		    if (typeof(this.hash[key]) == "undefined") { this.keys.push(key); }
		    this.hash[key] = value;
		  },
		  get : function(key) {
		    return this.hash[key];
		  },
		  getSortedKeys : function() {
			var k = this.keys;
			/*
			function sortNumber(a,b)
			{
			return a - b;
			}
			*/
		    k.sort(function(a, b){
				return a-b;
			});
		    return k;
		  }
		};
		
		// turn disparate feeds into one organized feed
		$(feed.twitter).each(function(){
			var weight = new Date().getTime()-new Date(this.created_at.replace(/^\w+ (\w+) (\d+) ([\d:]+) \+0000 (\d+)$/,"$1 $2 $4 $3 UTC")).getTime();
			weight += Math.random(0,1);

			weight = Math.round(weight * 1000);
			this.weight = weight;
			this.type = 'twitter';
			newFeed.set(weight,this);

		});
		
		$(feed.flickr).each(function(){
			var weight = new Date().getTime()-(this.dateupload*1000);
			weight = weight / 30;
			weight = weight + Math.random(0,1);
			weight = Math.round(weight * 1000);
			this.weight = weight;
			this.type = 'flickr';
			newFeed.set(weight,this);
		});
		$(feed.youtube).each(function(){
			var weight = new Date().getTime()-new Date(this.published['$t']);
			weight = weight / 30;
			weight = weight + Math.random(0,1);
			weight = Math.round(weight * 1000);
			this.weight = weight;
			this.type = 'youtube';
			newFeed.set(weight,this);
		});
		
		var feed = [];
		var sortedKeys = newFeed.getSortedKeys();
		for (var i in sortedKeys) { 
			//feed.push(newFeed.get(sortedKeys[i]));
			feed.push(newFeed.get(sortedKeys[i]));
			//print(sortedKeys[i]); 
		}


		return feed;
	}
	
	var writeFeed = function(feed) {

		feed = parseFeed(feed);
		
		var items = $('<div />');
		$(feed).each(function(){
			var item = $('<div class="item"></div>');

			switch(this.type) {
				case 'twitter' :
					item.addClass('twitter');
					date = prettyDate(new Date(this.created_at.replace(/^\w+ (\w+) (\d+) ([\d:]+) \+0000 (\d+)$/,"$1 $2 $4 $3 UTC")));
					var imgDiv = $('<div class="img"></div');
					var img = $('<img />');
					img.attr('src',this.profile_image_url).css({width:48,height:48});
					imgDiv.html(img);
					item.html(imgDiv).append(this.text).append('<div class="meta">'+date+'</div>').append('<hr />');
					//$('#feed').append(item);
				break;
				case 'youtube' :
					item.addClass('youtube');
					date = prettyDate(new Date(this.published['$t']));				
					var item = $('<div class="item youtube"></div>');
					var id = this.id['$t'].split(':').pop();
					item.html('<iframe title="YouTube video player" class="youtube-player" type="text/html" width="165" height="100" src="http://www.youtube.com/embed/'+id+'" frameborder="0"></iframe>');
					item.append('<div class="meta">'+date+'</div>').append('<hr />');

				break;
				case 'flickr' :
					item.addClass('flickr');
					date = prettyDate(new Date(this.dateupload*1000));
					var imgDiv = $('<div class="img"></div');
					var img = $('<img />');
					img.attr('src',this.url_s).css({maxWidth: 165});
					imgDiv.html(img);
					item.html(imgDiv).append('<div class="meta">'+date+'</div>').append('<hr />');
				break;
			}
			items.append(item);
			
		});
		$('#feed').append(items);
		
	}
	
	return {
		updateFeedData : function(name,data) {
			feedCount++;
			feed[name] = data;
			if (feedCount>=3) {
				writeFeed(feed);
			}
		}
	};
}();

var cities = function() {
	var articles = articles; // this handles the layouts of our articles

	return {
		feed : feeds
	};
}();

