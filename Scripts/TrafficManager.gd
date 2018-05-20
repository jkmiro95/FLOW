extends Node2D

var activeCollider = false
onready var trafficCollider = $TrafficCollider/Area2D/CollisionShape2D

func _ready():
	pass

func _Light_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		activeCollider=!activeCollider
		trafficCollider.set_disabled(activeCollider)
		print(activeCollider)
	pass # replace with function body
