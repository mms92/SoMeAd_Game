
class menu {
    errorDiv = null;
    displayInterval = null;
    displaySelectedAvatar()
    {
        for (const imgDom of document.getElementsByClassName("avatar")) {
            if ( imgDom.src.indexOf( Game.avatar ) > 0 )
            {
                imgDom.style.width = "160px";
                imgDom.style.height = "160px";
            }
            else
            {
                imgDom.style.width = "128px";
                imgDom.style.height = "128px";
            }
        }
    }
    startgame()
    {
        if ( Game.avatar != null )
        {
            Game.username = document.getElementById("username").value
            var xhttp = new XMLHttpRequest()
            xhttp.onreadystatechange = function()
            {
                if (this.readyState == 4 && this.status == 200) {
                    Game.id = JSON.parse( this.responseText )
                    Game.question.begin();
                }
            };
            xhttp.open("GET", "ss_scripts/sql.php/session/begin?name="+Game.username+"&avatar="+Game.avatar, true)
            xhttp.send()
            clearInterval( this.displayInterval )
        }
        else
        {
            if ( this.errorDiv == null )
            {
                this.errorDiv = document.createElement("div")
                document.body.appendChild( this.errorDiv )
            }
            this.errorDiv.innerText = "vous n'avez pas choisi d'avatar"
        }
    }

    selectAvatar( avatarId )
    {
        Game.avatar = '0'.repeat(5-Math.floor(Math.log10(avatarId)))+avatarId+'.png';
        this.displaySelectedAvatar();
    }

}

