extends Label

func _ready():
	self.text = "You've scored " + str(global.points) + " points!"
#	global.points = 0;