<?php
function utf8ize( $mixed ) {
    if (is_array($mixed)) {
        foreach ($mixed as $key => $value) {
            $mixed[$key] = utf8ize($value);
        }
    } elseif (is_string($mixed)) {
        echo $mixed." : ".mb_detect_encoding($mixed);
        return mb_convert_encoding($mixed, "UTF-8");
    }
    return $mixed;
}

function json_encode_with_error( $data )
{
    $data = utf8ize( $data );
    $json = json_encode($data);
    if ($json === false) {
        // Avoid echo of empty string (which is invalid JSON), and
        // JSONify the error message instead:
        $json = json_encode(["jsonError" => json_last_error_msg()]);
        if ($json === false) {
            // This should not happen, but we go all the way now:
            $json = '{"jsonError":"unknown"}';
        }
        // Set HTTP response status code to: 500 - Internal Server Error
        http_response_code(500);
    }
    return $json;
}


if ( $_SERVER["REQUEST_METHOD"] == "GET" )
{
    require_once "lib/database.php";
    header('Content-Type: application/json; charset=UTF-8;');
    //echo "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />";
    $url = $_SERVER["PHP_SELF"];
    $segment = explode("/", $url);
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
                echo json_encode_with_error($db->beginSession($_REQUEST["name"],$_REQUEST["avatar"]));
            }
            if ( isset( $_REQUEST["id"] ) )
            {
                if ( $subAction == "getQuestion" )
                {
                    $question = $db->getQuestion($_REQUEST["id"]);
                    var_dump($question);
                    echo json_encode_with_error( $question );
                }
                if ( $subAction == "getAnswers" )
                {
                    $answers = $db->getAnswers($_REQUEST["id"]);
                    var_dump($answers);
                    echo json_encode_with_error( $answers );
                }
                if ( $subAction == "verifyAnswer" && isset($_REQUEST["answersId"] ) )
                {
                    echo json_encode_with_error( "error: undeclared function");
                    //echo json_encode_with_error($db->answerCheck($_REQUEST["id"],$_REQUEST["answersId"]));
                }
            }
        }
        elseif ( isset($_REQUEST["id"]) )
        {
            echo json_encode_with_error( $db->getSession($_REQUEST["id"])[0] );
        }
    }
}
?>