<?php
if ( $_SERVER["REQUEST_METHOD"] == "GET" )
{
    require_once "lib/database.php";
    header('Content-Type: application/json');
    $url = $_SERVER["PHP_SELF"];
    $segment = explode("/", $url);
    print_r( $segment );
    $db = new SQL( "SoMeAd","abc123" );
    $action = $segment[ 4 ];
    if ( $action == "leaderboard" )
    {
        if ( isset($_REQUEST["name"]) && isset($_REQUEST["score"]) )
        {
            echo json_encode( $db->getLeaderBoardAround($_REQUEST["name"],$_REQUEST["score"]) );
        }
        else
        {
            echo json_encode($db->getLeaderBoard());
        }
    }
    if ( $action == "session" )
    {
        if ( count( $segment )== 6 && $segment[ 5 ] != "" )
        {
            $subAction = $segment[ 5 ];
            if ( $subAction == "begin" && isset($_REQUEST["name"]) && isset($_REQUEST["avatar"] ) )
            {
                echo json_encode($db->beginSession($_REQUEST["name"],$_REQUEST["avatar"]));
            }
            if ( isset( $_REQUEST["id"] ) )
            {
                if ( $subAction == "getQuestion" )
                {
                    echo json_encode($db->getQuestion($_REQUEST["id"]));
                }
                if ( $subAction == "getAnswer" )
                {
                    echo json_encode($db->getAnswer($_REQUEST["id"]));
                }
                if ( $subAction == "verifyAnswer" && isset($_REQUEST["answersId"] ) )
                {
                    echo json_encode($db->answerCheck($_REQUEST["id"],$_REQUEST["answersId"]));
                }
            }
        }
        elseif ( isset($_REQUEST["id"]) )
        {
            echo json_encode( $db->getSession($_REQUEST["id"])[0] );
        }
    }
}
?>