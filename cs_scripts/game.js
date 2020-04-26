const Game = {}
Game.username = null
Game.avatar = null
Game.id = null
Game.point = null
Game.questionText = null
Game.answersText = []
Game.menu = new menu()
Game.leaderboard = new leaderboard()
Game.question = new question()

setInterval(
    Game.menu.displaySelectedAvatar,
    0.1
);