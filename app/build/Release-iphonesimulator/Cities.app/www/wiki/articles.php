<?php
	$url = "http://api.wikilocation.org/articles?lat=".$latlong[0]."&lng=".$latlong[1]."&format=json&limit=50&radius=5000m";
	//echo $url;exit;
	$data = json_decode(fetch($url));
	//echo "<pre>";
	//print_r($articles);

	$pages = array();
	$articles = array();
	foreach($data->articles as $article) {
		$pages[] = str_replace(' ','_',$article->title);
		$articles[str_replace(' ','_',$article->title)] = $article;
	}
	$pages = array_unique($pages);
	//exit;
	
	
	$data =getViewsForPages($pages);
	echo "<table border='1'><tr><td><input type='checkbox' /></td><td>Page</td><td>Views</td></tr>";
	ob_flush();flush();
	foreach($data as $page=>$views) {
		echo "<tr><td><input type='checkbox' /></td><td><a href='".$articles[$page]->url."' target='_blank'>".$page."</a></td><td>".$views."</td></tr>";
	ob_flush();flush();		
	}
	echo "</table>";
	ob_flush();flush();	

	
	function getViewsForPages($pages) {
		$arr = array();
		foreach($pages as $p) {
			$arr[$p] = 0;
		}
		foreach($arr as $name=>&$views) {
			$views = getViews($name);
			echo '.';ob_flush();flush();
			//echo $name.': '.$views."<br />";
		}
		asort($arr);
		$arr = array_reverse($arr);
		return $arr;		
	}