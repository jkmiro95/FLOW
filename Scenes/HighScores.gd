extends Node

var savegame = File.new()
var path = "user://TrafficHighScores.save"

var Scores = [ 0, 0, 0, 0, 0]
var Names = [ "None", "None", "None", "None", "None"]

func _ready():
	pass

func LoadHighScores():
	if savegame.file_exists(path):
		savegame.open(path, File.READ)

		var i = 0
		while i < Scores.size():
			Names[i] = savegame.get_line()
			Scores[i] = savegame.get_line()
			i+=1

		savegame.close()
	pass

func SaveHighScores():
	savegame.open(path, File.WRITE)
	
	var i = 0
	while i < Scores.size():
		savegame.store_line(Names[i])
		savegame.store_line(str(Scores[i]))
		i+=1
	savegame.close()
	
func GetScorePosition(var NewScore):
	if int(NewScore) < int(Scores[4]):
		return int(-1)
	elif int(NewScore) < int(Scores[3]):
		return int(4)
	elif int(NewScore) < int(Scores[2]):
		return int(3)
	elif int(NewScore) < int(Scores[1]):
		return int(2)
	elif int(NewScore) < int(Scores[0]):
		return int(1)
	else:
		return int(0)
		
func PutNewHighScore(var Position, var NewScore, var NewName):
	var i = 4
	while i > Position:
		Scores[i] = Scores[i-1]
		Names[i] = Names[i-1]
		i-=1
	
	Scores[Position] = NewScore
	Names[Position] = NewName
	SaveHighScores()