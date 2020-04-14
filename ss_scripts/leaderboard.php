<?php
if ( $_SERVER["REQUEST_METHOD"] == "GET" )
{
    $url = $_SERVER["PHP_SELF"];
    $segment = $url->explode("/");
    echo json_encode( $segment );
}
?>