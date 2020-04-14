<?php
if ( $_SERVER["REQUEST_METHOD"] == "GET" )
{
    $url = $_SERVER["PHP_SELF"];
    $segment = explode("\/", $url);
    echo json_encode( $segment );
}
?>