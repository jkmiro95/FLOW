extends Node2D

export var SPEED = 200

var SPEED_CURRENT = 0; 
var SPEED_VEL_CURRENT = 0
var SPEED_VEL_MOVING = 1.1
var SPEED_VEL_BRAKING = 0.0
var SPEED_INITIAL = 1; 
var SPEED_MAX = 5;
var isActive=true
var isStoppedBeforeLights = false

onready var explosion = load("res://Scenes/Explosion.tscn");

func _ready():
	add_to_group("Cars")
	SPEED_CURRENT = SPEED_INITIAL
	SPEED_VEL_CURRENT = SPEED_VEL_MOVING;
	pass

func _process(delta):
	SPEED_CURRENT *= SPEED_VEL_CURRENT
	
	if(SPEED_CURRENT >= SPEED_MAX) :
		SPEED_CURRENT = SPEED_MAX
	elif(SPEED_CURRENT < 1):
		SPEED_CURRENT = 0;
			
	set_offset(get_offset() + (SPEED_CURRENT))

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
	SPEED_CURRENT = 0
	SPEED_VEL_CURRENT = SPEED_VEL_BRAKING
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
