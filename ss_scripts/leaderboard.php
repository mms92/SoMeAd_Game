<?php
if ( $_SERVER["REQUEST_METHOD"] == "GET" )
{
    require_once "lib/database.php";
    header('Content-Type: application/json');
    $url = $_SERVER["PHP_SELF"];
    $segment = explode("/", $url);
    $db = new SQL( "SoMeAd","abc123" );
    $results = $db->getLeaderBoard();
    if ($results != NULL) {
        $results_array = $results->fetchAll();
        echo json_encode( $results_array );
    } else {
        echo "0 results";
    }
}
?>