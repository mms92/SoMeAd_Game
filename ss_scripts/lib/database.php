<?php
class SQL {
	private $username;
	private $password;
	private $host;
	private $database;
    private $connection;
    private $operational;
    public function __construct( $host, $user, $pass, $database ) {
    	$this->username = $user;
    	$this->password = $pass;
    	$this->host = $host;
    	$this->database = $database;
        $this->operational = $this->connect();
    }
    private function connect() {
        $username = $this->username;
        $password = $this->password;
        $host = $this->host;
        $db = $this->database;
        $dsn = "mysql:host=$host".( empty($db) ? "" : ";dbname=$db" )
        try {
        	$this->connection = new PDO($dsn, $username, $password, array(
                PDO::ATTR_PERSISTENT => true
            ));
            $this->connection->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
            return true;
        }
        catch ( PDOException $e ) {
            echo "Connection to MySQL failed: ".$e->getMessage();
            return false;
        }
    }
    public function query($sql, $args){
        if ( !$operational ) return NULL;
        $connection = $this->connection;
        $stmt = $connection->prepare($sql);
        $stmt->execute($args);
        return $stmt;
    }
}
?>