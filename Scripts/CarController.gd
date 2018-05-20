extends Node2D

export var CAR_SPEED = 200
var isActive=true
var isStoppedBeforeLights = false

onready var explosion = load("res://Scenes/Explosion.tscn");

func _ready():
	add_to_group("Cars")
	pass

func _process(delta):
	set_offset(get_offset() + (CAR_SPEED*delta))

func _physics_process(delta):
	pass

func _on_Area2D_area_entered(area):
	if(!isActive):
		return
	if area.is_in_group("Cars"):
		_handleCarCollision(area)
	elif area.is_in_group("Lights"):
		_handleLightCollision(area)
	
	_stopCar()

func _stopCar():
	CAR_SPEED = 0
	isActive = false;

func _handleCarCollision(area):
	print("CAR-CAR COLLISION")
	if(area.get_parent().isStoppedBeforeLights):
		isStoppedBeforeLights = true
	else:
		_addExplosion()

func _handleLightCollision(area):
	isStoppedBeforeLights = true
	print("CAR-LIGHT COLLISION")

func _addExplosion():
	var explosionInstance = explosion.instance()
	explosionInstance.position = position
	get_parent().add_child(explosionInstance);
