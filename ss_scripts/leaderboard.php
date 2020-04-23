<?php
if ( $_SERVER["REQUEST_METHOD"] == "GET" )
{
    require_once "lib/database.php";
    $url = $_SERVER["PHP_SELF"];
    $segment = explode("/", $url);
    echo json_encode( $segment )."<br/>";
    $db = new SQL( "SoMeAd","abc123" );
    $results = $db->getLeaderBoard();
    var_dump( $results->fetchAll() );
    var_dump( $results->fetchAll() );
    echo "<br/>";
    if ($results != NULL) {
        // output data of each row
        while($row = $results->fetchAll()) {
            echo "id: " . $row["rank"]. " - Name: " . $row["name"]. " Score: " . $row["score"]. "<br>";
        }
    } else {
        echo "0 results";
    }
}
?>