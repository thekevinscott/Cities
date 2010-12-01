<style type="text/css" media="screen">
	body, html { padding: 0; margin: 0;}
	table {
		border-collapse:collapse;
	}
	table td {
		padding: 4px;
	}
</style>
<?php
require 'functions.php';
$url = "http://maps.google.com/maps/geo?q=".str_replace(' ','+',$_GET['place'])."&output=csv";
$latlong = explode(',',fetch($url));
$latlong = explode(',',$latlong[2].','.$latlong[3]);
require 'articles.php';
echo "<hr />";
require 'flickr.php';