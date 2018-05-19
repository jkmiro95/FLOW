extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var activeCollider = false

onready var trafficCollider = $TrafficCollider/Area2D/CollisionShape2D


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass




func _Light_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		activeCollider=!activeCollider
		trafficCollider.set_disabled(activeCollider)
		print(activeCollider)
	pass # replace with function body
