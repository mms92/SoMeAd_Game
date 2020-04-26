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
        if ( Game.answers != null && Game.answers.length > 0 )
        {
            for (const answerText of Game.answersText) {
                console.log( answerText )
                let answerDiv = document.createElement("p");
                answerDiv.innerText = answerText.answer;
                answerDiv.onclick = "Game.question.sendAnswer("+answerText.id+")"
                this.answersDiv.appendChild( answerDiv );
                if ( Game.validAnswer != null )
                {
                    if ( Game.validAnswer.id == answerText.id )
                    {
                        answerDiv.style.color = "0x00FF00"
                    }
                    else
                    {
                        answerDiv.style.color = "0xFF0000"
                    }
                }
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
                Game.questionText = JSON.parse( this.responseText )
                Game.validAnswer = null
                Game.question.display();
            }
        };
        xhttp.open("GET", "ss_scripts/sql.php/session/getQuestion?id="+Game.id, true)
        xhttp.send()

        var xhttp2 = new XMLHttpRequest()
        xhttp2.onreadystatechange = function()
        {
            if (this.readyState == 4 && this.status == 200) {
                Game.answersText = JSON.parse( this.responseText )
                Game.question.display();
            }
        };
        xhttp2.open("GET", "ss_scripts/sql.php/session/getAnswers?id="+Game.id, true)
        xhttp2.send()
    }
    sendAnswer( id )
    {
        var xhttp = new XMLHttpRequest()
        xhttp.onreadystatechange = function()
        {
            if (this.readyState == 4 && this.status == 200) {
                Game.validAnswer = JSON.parse( this.responseText );
                Game.question.display();
                setTimeout( Game.question.begin(), 5000 );
            }
        };
        xhttp.open("GET", "ss_scripts/sql.php/session/verifyAnswer?id="+Game.id+"&answerId="+id, true)
        xhttp.send()
    }
}