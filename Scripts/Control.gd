extends Control

signal start_game

func _ready():
	HighScores.LoadHighScores()

func _on_Button_pressed():
	$Button.hide()
	$Label.hide()
	get_tree().change_scene("res://Scenes/Pathfinding/Level_1.tscn")

func _on_btn_HighScores_pressed():
	get_tree().change_scene("res://Scenes/HighScoresScene.tscn")

func _on_btn_Back_pressed():
	get_tree().change_scene("res://Scenes/StartScene.tscn")