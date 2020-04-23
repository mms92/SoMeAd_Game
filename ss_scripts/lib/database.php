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
        $dsn = "mysql:host=$host".( empty($db) ? "" : ";dbname=$db" );
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
    public function getLeaderBoardAround( $name, $score )
    {
        if ( $this->operational == 0) return NULL;
        $this->query(  "SELECT @rank:= 0;", array() );
        $this->query(  "SELECT @targetRank:= ( SELECT s.rank FROM ( 
                            SELECT @rank:= @rank + 1 as rank, t.* FROM (
                            SELECT name, score FROM leaderboard ORDER BY score DESC, name ASC
                            ) t
                        ) s WHERE s.score='?' AND s.name='?'
                        );",array() );
        $this->query(  "SELECT @rank:= 0;",array());
        $stmt = $this->query(  "SELECT * FROM (
                                SELECT @rank:= @rank + 1 as rank, s.* FROM (
                                    SELECT name, score FROM leaderboard ORDER BY score DESC, name ASC
                                ) s
                                ) t WHERE t.rank BETWEEN @targetRank-2 AND @targetRank+2 OR t.rank<='5';"
                                , array($name,$score));
        return $stmt;
    }
    public function getLeaderBoard( )
    {
        if ( $this->operational == 0 ) return NULL;
        $this->query(  "SELECT @rank:= 0;",array() );
        $stmt = $this->query("SELECT * FROM ( SELECT @rank:= @rank + 1 as rank, s.* FROM ( SELECT name, score FROM leaderboard ORDER BY score DESC, name ASC ) s) t WHERE t.rank<='10';"
                                , array() );
        return $stmt;
    }

    public function beginSession( $name, $avatar )
    {
        $id = "";
        for ($i=0; $i < 16; $i++) { 
            if ( rand(0,1) > 0 )
            {
                $id = $id.sprintf("",rand(65,90));
            }
            else
            {
                $id = $id.sprintf("",rand(97,122));
            }
        }
        $result = array()
        do {
            $stmt = $this->query(
                "SELECT id FROM session WHERE id='?';",
                array( $id )
            );
            $result = $stmt->fetchAll();
        } while ($result->count() > 0);
        $this->connection->exec("INSERT INTO session ( id, name, avatar, score ) VALUES ( $id,$name,$avatar,0 )");
    }

    public function addScore( $name, $score )
    {
        $this->query( "INSERT INTO leaderboard ( name, score ) VALUES ( ?, ? );", array( $name, $score ) );
    }
}
?>