class question {
    questionDiv = null;
    answersDiv = null;
    answerDiv = [];
    begin ()
    {
        
        if ( this.questionDiv == null )
        {
            document.body.innerHTML = "";
            this.questionDiv = document.createElement("div");
            this.answersDiv = document.createElement("div");
            document.body.appendChild( this.questionDiv );
            document.body.appendChild( this.answersDiv );
        }
        this.request_Question_Data();
    }
    request_Question_Data()
    {
        var xhttp = new XMLHttpRequest()
        xhttp.onreadystatechange = function()
        {
            if (this.readyState == 4 && this.status == 200) {
                console.log( this.responseText )
                var data = JSON.parse( this.responseText )
                console.log( data )
                Game.question.questionDiv.innerText = data[0];

                if ( Game.question.answerDiv.length > 0 )
                {
                    for (const answerDiv of Game.question.answerDiv) {
                        Game.question.answersDiv.removeChild( answerDiv )
                    }
                    Game.question.answerDiv = []
                }

                for (const answerText of data[1] ) {
                    var answerDiv = document.createElement("p");
                    answerDiv.innerText = answerText.answer;
                    answerDiv.onclick = function()
                    {
                        Game.question.sendAnswer(answerText.id)
                    }
                    Game.question.answerDiv[answerText.id] = answerDiv
                    Game.question.answersDiv.appendChild( answerDiv );
                }
                Game.validAnswer = null
            }
        };
        xhttp.open("GET", "ss_scripts/sql.php/session/getData?id="+Game.id, true)
        xhttp.send()
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
                setTimeout( Game.question.request_Question_Data, 5000 );
            }
        };
        xhttp.open("GET", "ss_scripts/sql.php/session/verifyAnswer?id="+Game.id+"&answerId="+id, true)
        xhttp.send()
    }
}