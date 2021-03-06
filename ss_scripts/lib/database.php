<?php 

class SQL {
	private $username;
	private $password;
	private $database;
    private $connection;
    private $operational;
    public function __construct( $user, $pass ) {
    	$this->username = $user;
    	$this->password = $pass;
        $this->operational = $this->connect();
    }
    private function connect() {
        $username = $this->username;
        $password = $this->password;
        $host = "localhost";
        $db = "SoMeAd_Game";
        $dsn = "mysql:host=$host".( empty($db) ? "" : ";dbname=$db" ).";charset=utf8";
        try {
        	$this->connection = new PDO($dsn, $username, $password, array(
                PDO::ATTR_PERSISTENT => true
            ));
            $this->connection->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
            return 1;
        }
        catch ( PDOException $e ) {
            echo "Connection to MySQL failed: ".$e->getMessage();
            return 0;
        }
    }
    public function query($sql, $args){
        if ( $this->operational == 0 ) return NULL;
        $connection = $this->connection;
        $stmt = $connection->prepare($sql);
        $stmt->execute($args);
        return $stmt;
    }
    public function getLeaderBoardAround( $id )
    {
        if ( $this->operational == 0) return NULL;
        $this->connection->query(  "SELECT @rank:= 0;" )->fetchAll();
        $this->connection->query(  "SELECT @targetRank:= ( SELECT s.rank FROM ( 
                            SELECT @rank:= @rank + 1 as rank, t.* FROM (
                            SELECT id FROM leaderboard ORDER BY score DESC, name ASC
                            ) t
                        ) s WHERE s.id='$id'
                        );")->fetchAll();
        $this->connection->query(  "SELECT @rank:= 0;" )->fetchAll();
        return $this->query(  "SELECT * FROM (
                                SELECT @rank:= @rank + 1 as rank, s.* FROM (
                                    SELECT name, avatar, score FROM leaderboard ORDER BY score DESC, name ASC
                                ) s
                                ) t WHERE t.rank BETWEEN @targetRank-2 AND @targetRank+2 OR t.rank<='5';"
                                , array())->fetchAll();
    }
    
    public function getLeaderBoard( )
    {
        if ( $this->operational == 0 ) return NULL;
        $this->connection->query(  "SELECT @rank:= 0;" )->fetchAll();
        return $this->query("SELECT * FROM ( SELECT @rank:= @rank + 1 as rank, s.* FROM ( SELECT name, avatar, score FROM leaderboard ORDER BY score DESC, name ASC ) s) t WHERE t.rank<='10';"
                                , array() )->fetchAll();
    }

    public function beginSession( $name, $avatar )
    {
        
        $result = array();
        do {
            $id = "";
            for ($i=0; $i < 16; $i++) { 
                if ( rand(0,1) > 0 )
                {
                    $id = sprintf($id."%c",rand(65,90));
                }
                else
                {
                    $id = sprintf($id."%c",rand(97,122));
                }
            }
            $stmt = $this->query(
                "SELECT id FROM leaderboard WHERE id=?;",
                array( $id )
            );
            $result = $stmt->fetchAll();
        } while (count( $result ) > 0);
        $this->connection->exec("INSERT INTO leaderboard ( id, name, avatar ) VALUES ( '$id','$name','$avatar' );");
        return $id;
    }

    public function getSession( $id )
    {
        return $this->query( 
            "SELECT * FROM leaderboard WHERE leaderboard.id=?;",
            array( $id )
        )->fetchAll();
    }

    public function getQuestion($id)
    {
        return $stmt = $this->query(
            "SELECT questions.id as id, questions.data as question FROM questions,leaderboard where leaderboard.id=? and questions.id=leaderboard.question_counter;",
            array($id)
        )->fetchAll()[0];
    }
    public function getQuestionCount()
    {
        $this->connection->query( "SELECT @max:=0" );
        $this->connection->query( "SELECT @max:=@max+1 FROM questions WHERE 1" );
        return intval($this->query( "SELECT @max as max;"
                            ,array())->fetchAll()[0]["max"]);
    }
    public function getAnswers($id)
    {
        return $this->query(
            "SELECT answers.answer_id as id, answers.data as answer FROM answers,leaderboard where leaderboard.id=? and answers.question_id=leaderboard.question_counter;",
            array($id)
        )->fetchAll();
    }
    public function getCorrectAnswer($id)
    {
        return $answers = $this->query(
            "SELECT answers.answer_id as id FROM answers,leaderboard where leaderboard.id=? and answers.question_id=leaderboard.question_counter and answers.is_expected='1';",
            array($id)
        )->fetchAll();
    }
    public function answerCheck( $id, $answerId )
    {
        $correct = $this->getCorrectAnswer( $id )[0];
        if ( $correct["id"] == $answerId )
        {
            $this->incrementScore( $id );
        }
        $this->nextQuestion( $id );

        return $correct;
    }
    public function incrementScore( $id )
    {
        $this->connection->exec( "UPDATE `leaderboard` SET `score`=`score`+1 WHERE id='$id'");
    }
    public function nextQuestion( $id )
    {
        $this->connection->exec( "UPDATE `leaderboard` SET `question_counter`=`question_counter`+1 WHERE id='$id'");
    }
}
?>