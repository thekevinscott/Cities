<script type="text/javascript" charset="utf-8">
	var type = 'none';
</script>
<style type="text/css" media="screen">
	h1 {
		clear: both;
	}
	.img {
		padding: 20px;
		float: left;
		border: 1px solid #CCC;
	}
	.img:nth-child(4n+1) {
		clear: both;
	}
	.img input {
		width: 20px;
		height: 20px;
	}
	.img img {	
		float: right;
	}
	img {
		border: none;
	}
</style>
<?php

if ($_GET['img']) {
	?>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js" type="text/javascript"></script>
	
	<script type="text/javascript" charset="utf-8">
		function jsonFlickrApi(data) {
			var img = data.sizes.size.pop().source;
			$('document').ready(function(){
				$('body').append('<a href="http://www.flickr.com/<?= $_GET['owner'] ?>/<?= $_GET['img'] ?>"><img src="'+img+'" /></a>');
			});
		}
	</script>
	<?php
	
	$url = "http://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=".flickrkey."&photo_id=".$_GET['img']."&format=json";

	$data = fetch($url);
	if ($data) {
		ob_flush();flush();	
		echo '
		
		<script type="text/javascript" charset="utf-8">
			type="tag";
			'.$data.'
		</script>';
		ob_flush();flush();			
	} else {
		echo 'no returned data from flickr';
	}
	
	
	$url = '';
} else {
	
	
	
?>
<a href="javascript:;" id="generateCode">Generate Code</a>
<h1>Geotagged:</h1>
<div id="geotaggedPhotos"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
	var photos = {};
	function jsonFlickrApi(data) {
		data.typ = type;
		$('document').ready(function(){
			photos = data.photos.photo;
			$(data.photos.photo).each(function(i){
				var url = "http://farm"+this.farm+".static.flickr.com/"+this.server+"/"+this.id+"_"+this.secret+"_m_d.jpg";
				var img = "<a rel="+this.id+" target='_blank' href='flickr.php?img="+this.id+"&owner="+this.owner+"'><img src=\'"+url+"\' /></a>";
				var div = "<div id='img"+i+"' class='img' rel=''><input type='checkbox' />"+img+"</div>";
				switch(data.typ) {
					case 'geotag' :
						$("#geotaggedPhotos").append(div);
					break;
					default :
						$("#taggedPhotos").append(div);
					break;
				}
			});
		});
		//"http://farm3.static.flickr.com/2196/2264237410_a2695ce47d_o_d.jpg
		
		
		$('#generateCode').click(function(e){
			e.preventDefault();
			var checkboxes = $('#geotaggedPhotos input:checked').next();
			var images = [];
			$(checkboxes).each(function(){
				images.push($(this).attr('rel'));
			});
			window.open('saveImages.php?dir=<?= $_GET['place'] ?>&imgs='+images.join(','));
			
		});
	}
</script>
<?php
	if ($latlong[0]&&$latlong[1]) {
		$per_page = ($_GET['per_page']) ? $_GET['per_page'] : '500'; 
		$seshName = 'll'.$latlong[0].$latlong[1].$per_page;
		
		if ($_SESSION[$seshName]) {
			$data = $_SESSION[$seshName];
		} else {
			$url = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=".flickrkey."&has_geo=1&lat=".$latlong[0]."&lon=".$latlong[1]."&radius=20&radius_units=mi&format=json&extras=url_sq,url_t,url_s,url_m,url_o&min_upload_date=0&per_page=".$per_page;

			$data = fetch($url);
			$_SESSION[$seshName] = $data;
		}
		if ($data) {
			ob_flush();flush();
			echo '
			
			<script type="text/javascript" charset="utf-8">
				type="geotag";
				'.$data.'
			</script>';
			ob_flush();flush();
		} else {
			echo 'no returned data from flickr';
		}
		/*
		$url = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=".flickrkey."&text=".str_replace(' ','+',$_GET['place'])."&format=json&per_page=500";
		$data = fetch($url);
		if ($data) {
			ob_flush();flush();			
			echo '
			
			<script type="text/javascript" charset="utf-8">
				type="tag";
				'.$data.'
			</script>';
			ob_flush();flush();			
		} else {
			echo 'no returned data from flickr';
		}*/
		
		
	} else {
		echo 'no lat long';
	}
}
