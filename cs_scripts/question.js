class question {
    questionDiv;
    answersDiv;
    display ()
    {
        document.body.innerHTML = "";
        this.questionDiv = document.createElement("div");
        this.answersDiv = document.createElement("div");
        if ( Game.question != null )
        {
            this.questionDiv.innerText = Game.questionText;
        }
        if ( Game.answers.length > 0 )
        {
            for (const answer of Game.answersText) {
                let answer = document.createElement("div");
                answer.innerText = answer;
                this.answersDiv.appendChild( answer );
            }
        }
        document.body.appendChild( this.questionDiv );
        document.body.appendChild( this.answersDiv );
    }
    begin ()
    {
        var xhttp = new XMLHttpRequest()
        xhttp.onreadystatechange = function()
        {
            if (this.readyState == 4 && this.status == 200) {
                Game.questionText = this.responseText
            }
        };
        xhttp.open("GET", Game.prefix+"/ss_scripts/sql.php/session/getQuestion?id="+Game.id, true)
        xhttp.send()
    }
}