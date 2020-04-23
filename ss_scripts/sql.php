<?php
if ( $_SERVER["REQUEST_METHOD"] == "GET" )
{
    require_once "lib/database.php";
    header('Content-Type: application/json');
    $url = $_SERVER["PHP_SELF"];
    $segment = explode("/", $url);
    print_r( $segment );
    $db = new SQL( "SoMeAd","abc123" );
    $action = $segment[ $segment->count() - 1 ];
    if ( $action == "leaderboard" )
    {
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
    if ( $action == "session" )
    {
        
    }
}
?>