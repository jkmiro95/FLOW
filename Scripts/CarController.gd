extends Node2D
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var CAR_SPEED = 200
var isMoving=true
var isStoppedBeforeLights = false

func _ready():
	add_to_group("Cars")
	# Called every time the node is added to the scene.
	# Initialization here
	pass

	
func _process(delta):
	set_offset(get_offset() + (CAR_SPEED*delta))
	
func _physics_process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	#if isMoving:
		#moveRight()
	
	pass
	
	
func moveRight():
	position += Vector2(-3,0)
	
	pass
	
	
func stop():
	
	#stop the cars
	pass


func _on_Area2D_area_entered(area):
	
	print("COLLISION")
	print(area.get_groups())
	if area.is_in_group("Cars"):
		print("IN CARS")
		CAR_SPEED = 0
	
	pass # replace with function body
