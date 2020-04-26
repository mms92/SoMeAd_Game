class leaderboard {
    leaderboardDiv = null;
    tableBody = null;
    begin()
    {
        document.body.innerHTML = ""
        this.leaderboardDiv = document.createElement("table")

        var description = document.createElement("caption")
        description.innerText = "Tableau des scores"

        this.tableBody = document.createElement("tbody")

        this.leaderboardDiv.appendChild( description )
        this.leaderboardDiv.appendChild( this.tableBody )
        this.getData()
    }
    createRow( rank, name, avatar, score )
    {
        var tableRow = document.createElement("tr")

        var rankcell = document.createElement("td")
        var namecell = document.createElement("td")
        var avatarcell = document.createElement("td")
        var scorecell = document.createElement("td")

        tableRow.appendChild( rankcell );
        tableRow.appendChild( namecell );
        tableRow.appendChild( scorecell  );
        tableRow.appendChild( avatarcell );

        this.tableBody.appendChild( tableRow );

        rankcell.innerText = rank
        namecell.innerText = name
        avatarcell.innerHTML = "<img src='images/"+avatar+"' style=\"width:64px\; height:64px;\">"
        scorecell.innerText = score
    }
    getData()
    {
        var xhttp = new XMLHttpRequest()
        xhttp.onreadystatechange = function()
        {

            data = JSON.parse( this.responseText )
            for (const row of data) {
                Game.leaderboard.createRow( row.rank, row.name, row.avatar, row.score )
            }
        };
        xhttp.open("GET", "ss_scripts/sql.php/leaderboard/?id="+Game.id, true)
        xhttp.send()
    }
}
