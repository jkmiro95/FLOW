extends Node

# EXPORT -------------------------
export(PackedScene) var cars 

# ONREADY ------------------------


# VARS ---------------------------

var paths

func _ready():
	paths = get_children()
	print(paths)

