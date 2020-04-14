<?php
if ( $_SERVER["REQUEST_METHOD"] == "GET" )
{
    require_once "lib/database.php";
    $url = $_SERVER["PHP_SELF"];
    $segment = explode("/", $url);
    echo json_encode( $segment );
    $db = new SQL( "SoMeAd","abc123" );
    echo $db->getLeaderBoard();
    
}
?>