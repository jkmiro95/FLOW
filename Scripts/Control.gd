extends Control

signal start_game

func _ready():
	pass

func _on_Button_pressed():
	$Button.hide()
	$Label.hide()
	emit_signal("start_game")
	
