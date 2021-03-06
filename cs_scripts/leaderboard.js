class leaderboard {
    leaderboardDiv = null;
    tableBody = null;
    begin()
    {
        document.body.innerHTML = ""
        Game.leaderboard.leaderboardDiv = document.createElement("table")
        Game.leaderboard.leaderboardDiv.id = "leaderboard_table"
        var description = document.createElement("caption")
        description.innerText = "Classement"
        description.id = "desc"

        Game.leaderboard.tableBody = document.createElement("tbody")
        Game.leaderboard.leaderboardDiv.appendChild( description )
        Game.leaderboard.leaderboardDiv.appendChild( Game.leaderboard.tableBody )
        document.body.appendChild( Game.leaderboard.leaderboardDiv )
        Game.leaderboard.getData()
    }
    createRow( rank, name, avatar, score )
    {
        let tableRow = document.createElement("tr")
        tableRow.className = "leaderboard_entry"

        let rankcell = document.createElement("td")
        let namecell = document.createElement("td")
        let avatarcell = document.createElement("td")
        let scorecell = document.createElement("td")

        tableRow.appendChild( rankcell );
        tableRow.appendChild( namecell );
        tableRow.appendChild( scorecell  );
        tableRow.appendChild( avatarcell );
        
        Game.leaderboard.tableBody.appendChild( tableRow );

        rankcell.innerHTML = rank + "<sup>" + ( rank == 1 ? "er" : "ème" ) + "</sup>"
        namecell.innerText = name
        avatarcell.innerHTML = "<img class='leaderboard_avatar' src='images/"+avatar+"' style=\"width:64px\; height:64px;\">"
        scorecell.innerHTML = score + "pts"
    }
    getData()
    {
        var xhttp = new XMLHttpRequest()
        xhttp.onreadystatechange = function()
        {
            if (this.readyState == 4 && this.status == 200) {
                console.log( this.responseText )
                let data = JSON.parse( this.responseText )
                for (const row of data) {
                    Game.leaderboard.createRow( row.rank, row.name, row.avatar, row.score )
                }
            }
        };
        xhttp.open("GET", "ss_scripts/sql.php/leaderboard/?id="+Game.id, true)
        xhttp.send()
    }
}
