<?php
if ( $_SERVER["REQUEST_METHOD"] == "GET" )
{
    require_once "lib/database.php"
    $db = new SQL( "SoMeAd","abc123" )
    $db->getLeaderBoard()
    $url = $_SERVER["PHP_SELF"];
    $segment = explode("/", $url);
    echo json_encode( $segment );
}
?>