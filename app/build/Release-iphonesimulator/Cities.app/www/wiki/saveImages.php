<?php
require 'functions.php';
if ($_GET['imgs']) {
	
	
	$dirname = ($_GET['dir']) ? $_GET['dir'] : time();
	$dirname = str_replace(' ','_',$dirname);
	makeMyDir($dirname);
	makeMyDir($dirname.'/original');
	makeMyDir($dirname.'/medium');
	
	
	
	
	$imgs = explode(',',$_GET['imgs']);
	$img_array = array();
	foreach($imgs as $img) {

		$url = "http://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=".flickrkey."&photo_id=".$img;
		$data = fetch($url);
		$xml = simplexml_load_string($data);
		$images = $xml->sizes;
		
		// first do top size
		saveImage($images,count($xml->sizes->size)-1,$dirname.'/original',$img);
		saveImage($images,3,$dirname.'/medium',$img);
		$img_array[] = '"'.$dirname.'/medium/'.$img.'.jpg"';
	}
	echo '['.implode(",",$img_array).']';
	
	
}

function saveImage($images,$index,$dirname,$image_name) {
	if (isset($images->size[$index])) {
		
		$topSize = $images->size[$index];
		$image = $topSize->attributes();
		$image = $image->source;
		$imageData = imagecreatefromjpeg($image);
		$path = $dirname.'/'.$image_name.'.jpg';
		imagejpeg($imageData, $path);
		chmod($path, 0777);
	}
}