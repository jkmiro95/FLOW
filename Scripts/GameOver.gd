extends Control

signal start_game
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var Position = -1

func _ready():
	Position = int(HighScores.GetScorePosition(int(global.points)))
	if Position<0:
		$TextEdit.hide()
		print("Position < 0")
	else:
		print("Position >= 0")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Button_pressed():
	if Position<0:
		print("Your score is too low to be saved")
	else:
		print("Put new high score")
		HighScores.PutNewHighScore(int(Position), int(global.points), str($TextEdit.text))
	$Button.hide()
	$Label.hide()
	global.points = 0
	get_tree().change_scene("res://Scenes/Pathfinding/Level_1.tscn")


func _on_btn_Menu_pressed():
	if Position<0:
		print("Your score is too low to be saved")
	else:
		print("Put new high score")
		HighScores.PutNewHighScore(int(Position), int(global.points), str($TextEdit.text))
	global.points = 0
	get_tree().change_scene("res://Scenes/StartScene.tscn")
