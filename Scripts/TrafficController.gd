extends Node2D

var blockCars = false

func _ready():
	pass

func _on_Area2D2_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		blockCars=!blockCars
		print("blockCars "+name)
		print(blockCars)
	pass 
