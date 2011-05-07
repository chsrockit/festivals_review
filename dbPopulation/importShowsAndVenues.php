<?php

$dbc = @mysqli_connect ("localhost", "testuser", "password", "culturehack") OR die ('Could not connect to MySQL: '. mysqli_connect_error() );

ini_set("memory_limit","128M");

$myFile = "listings.json";
$fh = fopen($myFile, 'r');
$rawJSON = fread($fh, filesize($myFile));
fclose($fh);


//$rawJSON = get_url_contents("http://projects.festivalslab.com/2010/api/v1/listings.json");

$festivalJSON = json_decode($rawJSON, true);

//print count($fringeJSON);

$festival_id = 1; // Change this later!

foreach($festivalJSON as $currentShow) {

	// Start with Fringe Festival events only
	if(stristr($currentShow['area_desc'], "Edinburgh Festival Fringe")) {
	
	//echo $currentShow['event_desc'] . "<br />";
	
	// Assemble the start_date column entry using the start date and start time
	$start_date = $currentShow['start_date_yyyymmdd'];
	$start_date = substr($start_date, 0, 4) . "-" . substr($start_date, 4, 2) . "-" . substr($start_date, 6, 2);
	$start_time = $currentShow['start_time_hhmmss'];
	$hour = substr($start_time, 0, (strlen($start_time) - 4));
	if(strlen($hour) == 1) {
		$hour = "0" . $hour;
	}
	$minutes = substr($start_time, strlen($start_time) - 4, 4);
	$hour = $hour . ":" . substr($minutes, 0, 2) . ":" . substr($minutes, 2, 2);
	$start_date = $start_date . " " . $hour;
	
	// Assemble the end_date column entry using the end date and end time
	
	$end_date = $currentShow['end_date_yyyymmdd'];
	$end_date = substr($end_date, 0, 4) . "-" . substr($end_date, 4, 2) . "-" . substr($end_date, 6, 2);
	$end_time = $currentShow['end_time_hhmmss'];
	$hour = substr($end_time, 0, (strlen($end_time) - 4));
	if(strlen($hour) == 1) {
		$hour = "0" . $hour;
	}
	$minutes = substr($end_time, strlen($end_time) - 4, 4);
	$hour = $hour . ":" . substr($minutes, 0, 2) . ":" . substr($minutes, 2, 2);
	$end_date = $end_date . " " . $hour;
	
	// Get the show name and description
	$show_name = $currentShow['event_desc'];
	$show_desc = $currentShow['event_info'];
	$show_genre = $currentShow['main_class'];
	$timestamp = time();
	$datetime = date("Y-m-d H:i:s", $timestamp);
	
	//echo $start_date."<br/>";
	
	/***********/
	
	$venue = $currentShow['venue_desc'];
	
	$q = "SELECT id FROM venues WHERE name LIKE '$venue'";
	
	$r = @mysqli_query ($dbc, $q);
	
	
	if($r && $r->num_rows > 0) {
		$value = $r->fetch_row();
		$venue_id = $value[0];
		// Use this for the venue_id field.
		echo "Something<br/>";
	} else {
		// Create a new entry in the venues table and THEN use its key for the venue_id field.
		echo "Nothing<br/>";
		
		$venue_name = $currentShow['venue_desc'];
		$venue_address = $currentShow['venue_addr'];
		
		echo "<br/>";
		echo $venue_name."<br/>";
		echo $venue_address."<br/>";
		echo $festival_id."<br/>";
		echo "<br/>";
		
		$q = "INSERT INTO venues (name, address, festival_id, created_at) VALUES ('$venue_name', '$venue_address', '$festival_id', NOW() )";
		$r = @mysqli_query ($dbc, $q);
		
		$venue_id = mysqli_insert_id($dbc);
		
		
	}
	
	/***********/
	
		
	$q = "INSERT INTO shows (festival_id, venue_id, name, description, genre, start_date, end_date, created_at) VALUES ('$festival_id', '$venue_id', '$show_name', '$show_desc', '$show_genre', '$start_date', '$end_date', NOW() )";
	$r = @mysqli_query ($dbc, $q);

	//echo "Fringe Show<br />";
	
	}

}

function add_show_to_database($festival) {


}

function get_url_contents($url){
        $crl = curl_init();
        $timeout = 5;
        curl_setopt ($crl, CURLOPT_URL,$url);
        curl_setopt ($crl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt ($crl, CURLOPT_CONNECTTIMEOUT, $timeout);
        $ret = curl_exec($crl);
        curl_close($crl);
        return $ret;
}


?>