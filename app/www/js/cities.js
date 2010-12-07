/*******************************************************************
*
*	Cities!
*
*
*	This is the main Javascript class for Cities. It handles loading other 
*	javascript files, and is the main entrance point for the app.
*
*	Copyright 2010 Scottlabs, LLC
*
*
*******************************************************************/

var cities = {
	getDirectory : function(data) {
		var directory = [];
		for (var i in data) {
			directory.push(data[i].replace(/ /g,"_"));			
		};
		return directory.join('_');
	},
	
	loadImg : function(path,callback) {
		var img = $('<img />');
		img.attr('src',path);
		if (callback) {
			img.load(callback);
		}
	},
	
	loadController : function(data) {
		var ths = this;
		ths[data.page] = {};
		$.getScript('controllers/'+data.page+'.js',function(){
			ths[data.page] = window[data.page];
			
		});
	},
	
	loadView : function(data) {
		
		var dir = this.getDirectory([data.city,data.state]);
		var el = $("<div />");
		
		$.get('views/'+data.page+'.html',function(data){
			el.addClass('page');
			el.html(data);
			el.find('img.load').each(function(){
				$(this).attr('src','city_data/'+dir+'/'+$(this).attr('id')+'.png');
			});			
			$('body').append(el);
		});
	},
	
	main : function(data) {
		data.page = 'title';
		this.loadController(data);
		this.loadView(data);
	}
};