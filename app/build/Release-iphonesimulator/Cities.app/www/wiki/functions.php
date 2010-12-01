<?php
session_start();
set_time_limit(0);
error_reporting(E_ALL ^ E_NOTICE);

define ('flickrkey','e4ed6a6662d84096dcf7a555ce8e5b0d');
function fetch($url,$header=null) {	
	if (! $_SESSION[$url]) {
		
		$ch = curl_init();
		$timeout = 120; // set to zero for no timeout
		curl_setopt ($ch, CURLOPT_URL, $url);
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
		//curl_setopt ($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/3.2.1 Safari/525.27.1");
		$data = curl_exec($ch);
		curl_close($ch);
		$_SESSION[$url] = $data;
	}
	
	return $_SESSION[$url];
}
function getViews($url) {
	//$data = 'Data has been viewed a million times';
	$url = "http://stats.grok.se/en/201009/".$url;
	$data = fetch($url);
	$data = substr($data,strpos($data,'has been viewed')+strlen('has been viewed'));
	$data = substr($data,0,strpos($data,'times'));
	return trim($data);
}

function makeMyDir($dirname) {
	if (is_dir($dirname)) {


		if ($handle = opendir($dirname)) {
		    /* This is the correct way to loop over the directory. */
		    while (false !== ($file = readdir($handle))) {
				if ($file!= '.' && $file != '..' && ! is_dir($dirname.'/'.$file)) {
					unlink($dirname.'/'.$file);
				}
		    }

		    closedir($handle);
		}
		chmod($dirname, 0777);

	} else {
		mkdir($dirname);
		chmod($dirname, 0777);		
	}
}
