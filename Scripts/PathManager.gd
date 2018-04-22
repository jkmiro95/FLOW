extends Node

# EXPORT -------------------------
export(Array) var cars 
export var deployDelay = 1

# ONREADY ------------------------

onready var timer = $"../DeployTimer"

# VARS ---------------------------

var paths

func _ready():
	paths = get_children()
	timer.wait_time = deployDelay

func _on_DeployTimer_timeout():
	print("tick!" + str(rand_range(0, 10000)))
	var car = cars[rand_range(0, cars.size() -1)].instance()
	var path = paths[rand_range(0, paths.size())]
	path.add_child(car)
#	timer.start()