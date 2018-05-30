extends Node2D

var activeCollider = false

onready var carColliderShape = $CarColldier/CollisionShape2D
onready var carCollider = $CarColldier

func _ready():
	pass

func _Light_input_event(viewport, event, shape_idx):
	
	if (event is InputEventMouseButton && event.pressed):
		activeCollider=!activeCollider
		carColliderShape.set_disabled(activeCollider)
		
		if(activeCollider == true):
			carCollider.resumeCar();

		print(activeCollider)
	pass # replace with function body
