
const Game = {}

Game.avatar = "000001.png"

function displaySelectedAvatar()
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
setInterval(
    displaySelectedAvatar,
    0.1
);
function startgame()
{
    let username = document.getElementById("username").value;
    console.log( username );
}

function selectAvatar( avatarId )
{
    Game.avatar = '0'.repeat(5-Math.floor(Math.log10(avatarId)))+avatarId+'.png';
    displaySelectedAvatar();
}

