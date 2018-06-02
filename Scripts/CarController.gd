extends Node2D

export var SPEED = 200

var SPEED_CURRENT = 0; 
var SPEED_VEL_CURRENT = 0
var SPEED_VEL_MOVING = 1.5
var SPEED_VEL_BRAKING = 0.5
var SPEED_INITIAL = 1; 
var SPEED_MAX = 200;
var direction = 0;

var isLightVisible = false;
var isActive=true
var isStoppedBeforeLights = false
var collidingWithGameOverCollider = false
var collidingCar;
var t = Timer.new()

onready var resumeTimer = $ResumeTimer;
onready var lightTimer = $LightTimer;

onready var leftLight = $LeftLight;
onready var rightLight = $RightLight;

onready var explosion = load("res://Scenes/Explosion.tscn");


func _ready():
	add_to_group("Cars")
	
	direction = get_parent().direction;
	_hideLights()
	SPEED_CURRENT = SPEED_INITIAL
	SPEED_VEL_CURRENT = SPEED_VEL_MOVING
	t.set_wait_time(1.5)
	pass

func _hideLights():
	leftLight.hide();
	rightLight.hide();
	
func _process(delta):
	SPEED_CURRENT *= SPEED_VEL_CURRENT
	
	if(SPEED_CURRENT >= SPEED_MAX) :
		SPEED_CURRENT = SPEED_MAX
	elif(SPEED_CURRENT < 1):
		SPEED_CURRENT = 0;
			
	set_offset(get_offset() + (SPEED_CURRENT * delta))
	
	if(self.unit_offset > 0.65):
		lightTimer.stop();
		_hideLights();
	
	if(self.unit_offset > 0.95):
		_scorePoints();
		_destroy();

func _physics_process(delta):
	pass

func _on_Area2D_area_entered(area):	
	
	if(area.is_in_group("Game_Over_Collider")):
		collidingWithGameOverCollider = true;
		
	if(!isActive):
		pass
		
	elif area.is_in_group("Cars"):
		_handleCarCollision(area)
		_stopCar()
	elif area.is_in_group("Lights"):
		area.car = self;
		_handleLightCollision(area)
		_stopCar()
	
func _on_Area2D_area_exited(area):
	if(area.is_in_group("Game_Over_Collider")):
		collidingWithGameOverCollider = false;
	
	
func resume():
	SPEED_CURRENT = 10;
	SPEED_VEL_CURRENT = SPEED_VEL_MOVING;
	
	resumeTimer.start();
	

func _stopCar():
	#SPEED_CURRENT = 0
	SPEED_VEL_CURRENT = SPEED_VEL_BRAKING
	isActive = false
	
	if(collidingWithGameOverCollider == true):
		_gameOver()

func _scorePoints():
	global.points += 1

func _gameOver():
	get_tree().change_scene("res://Scenes/GameOver.tscn")


func _destroy():
	queue_free()

func _handleCarCollision(area):
	if(area.get_parent().isStoppedBeforeLights):
		area.get_parent().collidingCar = self
		isStoppedBeforeLights = true
	else:
		_addExplosion()
		add_child(t)
		t.start()
		yield(t, "timeout")
		_gameOver()

func _handleLightCollision(area):
	isStoppedBeforeLights = true

func _addExplosion():
	var explosionInstance = explosion.instance()
	explosionInstance.position = position
	get_parent().add_child(explosionInstance);


func _on_Timer_timeout():
	print("TIMEOUT");
	resumeTimer.stop();
	isActive = true;
	isStoppedBeforeLights = false;
	
	if(collidingCar != null):
		collidingCar.resume();
		collidingCar = null;


func _on_LightTimer_timeout():
	print("LIGHT TICK");
	
	if(direction > 0):
		if(isLightVisible):
			rightLight.hide()
		else:
			rightLight.show()
	if(direction < 0):
		if(isLightVisible):
			leftLight.hide()
		else:
			leftLight.show()
	
	isLightVisible = !isLightVisible
