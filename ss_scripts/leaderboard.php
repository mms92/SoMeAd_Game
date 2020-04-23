<?php
if ( $_SERVER["REQUEST_METHOD"] == "GET" )
{
    require_once "lib/database.php";
    header('Content-Type: application/json');
    $url = $_SERVER["PHP_SELF"];
    $segment = explode("/", $url);

    $db = new SQL( "SoMeAd","abc123" );
    if ( isset($_REQUEST["name"]) && isset($_REQUEST["score"]) )
    {
        $results = $db->getLeaderBoardAround($_REQUEST["name"],$_REQUEST["score"]);
        if ($results != NULL) {
            $results_array = $results->fetchAll();
            echo json_encode( $results_array );
        }
    }
    else
    {
        $results = $db->getLeaderBoard();
        if ($results != NULL) {
            $results_array = $results->fetchAll();
            echo json_encode( $results_array );
        }
    }
    
}
?>