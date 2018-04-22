extends Node2D

export var CAR_SPEED = 80


func _ready():
	pass
	
func _process(delta):
	set_offset(get_offset() + (CAR_SPEED*delta))