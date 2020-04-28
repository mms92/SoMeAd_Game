class question {
    questionDiv = null;
    countDiv = null;
    answersDiv = null;
    answerDiv = [];
    begin ()
    {
        Game.menu.displayInterval
        if ( this.questionDiv == null )
        {            document.body.innerHTML = "";
            this.questionDiv = document.createElement("div");
            this.questionDiv.id = "question_div"
            this.answersDiv = document.createElement("div");
            this.answersDiv.id = "answers_div"
            this.countDiv = document.createElement("div");
            this.countDiv.id = "count_div"
            document.body.appendChild( this.countDiv );
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
                Game.questionId = parseInt(data[0]["id"]) + 1;
                Game.questionCount = data[1];
                Game.question.questionDiv.innerHTML = "<span id=question>"+data[0]["question"]+"</span>"
                Game.question.countDiv.innerText = Game.questionId+" / "+Game.questionCount
                if ( Game.question.answerDiv.length > 0 )
                {
                    for (const answerDiv of Game.question.answerDiv) {
                        Game.question.answersDiv.removeChild( answerDiv )
                    }
                    Game.question.answerDiv = []
                }

                for (const answerText of data[2] ) {
                    var answerDiv = document.createElement("p");
                    answerDiv.className = "answers"
                    answerDiv.innerHTML = "<span class=answer>"+answerText.answer+"</span>";
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
                if ( Game.questionId < Game.questionCount )
                {
                    setTimeout( Game.question.request_Question_Data, 5000 );
                }
                else
                {
                    setTimeout( Game.leaderboard.begin, 5000 );
                }
            }
        };
        xhttp.open("GET", "ss_scripts/sql.php/session/verifyAnswer?id="+Game.id+"&answerId="+id, true)
        xhttp.send()
    }
}