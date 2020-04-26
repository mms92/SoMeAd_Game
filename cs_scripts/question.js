class question {
    questionDiv;
    answersDiv;
    answerDiv = [];
    begin ()
    {
        document.body.innerHTML = "";
        this.questionDiv = document.createElement("div");
        this.answersDiv = document.createElement("div");

        document.body.appendChild( this.questionDiv );
        document.body.appendChild( this.answersDiv );

        var xhttp = new XMLHttpRequest()
        xhttp.onreadystatechange = function()
        {
            if (this.readyState == 4 && this.status == 200) {
                console.log( this.responseText )
                Game.question.questionDiv.innerText = JSON.parse( this.responseText );
                Game.validAnswer = null
            }
        };
        xhttp.open("GET", "ss_scripts/sql.php/session/getQuestion?id="+Game.id, true)
        xhttp.send()

        var xhttp2 = new XMLHttpRequest()
        xhttp2.onreadystatechange = function()
        {
            if (this.readyState == 4 && this.status == 200) {
                for (const answerText of JSON.parse( this.responseText )) {
                    var answerDiv = document.createElement("p");
                    answerDiv.innerText = answerText.answer;
                    answerDiv.onclick = function()
                    {
                        Game.question.sendAnswer(answerText.id)
                    }
                    Game.question.answerDiv[answerText.id] = answerDiv
                    Game.question.answersDiv.appendChild( answerDiv );
                }
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
                console.log( this.responseText );
                Game.validAnswer = JSON.parse( this.responseText );
                for (const key in Game.question.answerDiv) {
                    if (Game.question.answerDiv.hasOwnProperty(key)) {
                        const element = Game.question.answerDiv[key];
                        if ( key == Game.validAnswer.id )
                        {
                            element.style.color = "rgb(0,255,0)";
                        }
                        else
                        {
                            element.style.color = "rgb(255,0,0)";
                        }
                    }
                }
                setTimeout( Game.question.begin, 5000 );
            }
        };
        xhttp.open("GET", "ss_scripts/sql.php/session/verifyAnswer?id="+Game.id+"&answerId="+id, true)
        xhttp.send()
    }
}