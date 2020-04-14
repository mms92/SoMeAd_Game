<?php
if ( $_SERVER["REQUEST_METHOD"] == "GET" )
{
    require_once "lib/database.php";
    $url = $_SERVER["PHP_SELF"];
    $segment = explode("/", $url);
    echo json_encode( $segment );
    $db = new SQL( "SoMeAd","abc123" );
    $results = $db->getLeaderBoard();
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            echo "id: " . $row["rank"]. " - Name: " . $row["name"]. " Score: " . $row["score"]. "<br>";
        }
    } else {
        echo "0 results";
    }
}
?>