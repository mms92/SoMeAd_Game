<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <form>
            <label for="login">Database Username</label>
            <input id ="login" type="text" name="login"><br>
            <label for="pass">Database Password</label>
            <input id ="pass" type="password" name="pass"><br>
            <input type="submit" value="Installer"><br><br>
        </form method="post">
        <?php

            if ( $_SERVER["REQUEST_METHOD"] != "POST" ) return;

            require_once "lib/database.php"

            $login = $_REQUEST["login"]
            $pass = $_REQUEST["pass"]

            if ( empty($login) ) 
            {
                die("login is blank")
            }
            if ( empty($pass) ) 
            {
                die("password is blank")
            }
            $file = fopen("config/credential.cfg") or die("credential.cfg could not be created, make sure the php application have right to write in ss/config/ folder of the project")
            fwrite( $file, $login."\n" )
            fwrite( $file, $pass."\n" )

            $bdd = new database( "127.0.0.1", $login, $pass )
            
            $result = $bdd->query(
                "show databases",
                array()
            )
            foreach ($result as $key => $value) {
                echo $key." => ".$value
            }
        ?>
    </body>
</html>



