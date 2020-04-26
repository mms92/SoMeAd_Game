class question {
    questionDiv;
    answersDiv;
    display ()
    {
        this.questionDiv = document.createElement("div");
        this.answersDiv = document.createElement("div");
        if ( Game.question != null )
        {
            this.questionDiv.innerText = Game.question;
        }
        if ( Game.answers.length > 0 )
        {
            for (const answer of Game.answers) {
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
                Game.question = this.responseText
            }
        };
        xhttp.open("GET", "/ss_scripts/sql.php/session/getQuestion?id="+Game.id, true)
        xhttp.send()
    }
}