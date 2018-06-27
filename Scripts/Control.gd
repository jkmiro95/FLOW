extends Control

signal start_game

func _ready():
	pass

func _on_Button_pressed():
	$Button.hide()
	$Label.hide()
	get_tree().change_scene("res://Scenes/Pathfinding/Level_1.tscn")
	
