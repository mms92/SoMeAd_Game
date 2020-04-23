<?php
if ( $_SERVER["REQUEST_METHOD"] == "GET" )
{
    require_once "lib/database.php";
    $url = $_SERVER["PHP_SELF"];
    $segment = explode("/", $url);
    echo json_encode( $segment )."<br/>";
    $db = new SQL( "SoMeAd","abc123" );
    $results = $db->getLeaderBoard();
    echo "<br/>";
    if ($results != NULL) {
        $results_array = $results->fetchAll();
        echo json_encode( $results_array );
    } else {
        echo "0 results";
    }
}
?>