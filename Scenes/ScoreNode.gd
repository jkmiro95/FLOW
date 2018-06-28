extends Node

func _ready():
	get_node("Score0").text = HighScores.Names[0] + " - " + str(HighScores.Scores[0])
	get_node("Score1").text = HighScores.Names[1] + " - " + str(HighScores.Scores[1])
	get_node("Score2").text = HighScores.Names[2] + " - " + str(HighScores.Scores[2])
	get_node("Score3").text = HighScores.Names[3] + " - " + str(HighScores.Scores[3])
	get_node("Score4").text = HighScores.Names[4] + " - " + str(HighScores.Scores[4])