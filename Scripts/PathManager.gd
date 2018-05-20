extends Node

# EXPORT -------------------------
var cars = [] 
export var deployDelay = 3
onready var carobj = load("res://Scenes/Car.tscn");
# ONREADY ------------------------

onready var timer = $"../DeployTimer"

# VARS ---------------------------

var paths

func _ready():
	cars.push_back(carobj)
	paths = get_children()
	timer.wait_time = deployDelay

func _on_DeployTimer_timeout():
	print("tick!" + str(rand_range(0, 10000)))
	var car = cars[rand_range(0, cars.size() -1)].instance()
	var path = paths[rand_range(0, paths.size())]
	path.add_child(car)
#	timer.start()