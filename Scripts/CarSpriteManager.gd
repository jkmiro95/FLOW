extends Sprite

const images = [preload("res://Images/Vehicles/Ambulance.png"),
				preload("res://Images/Vehicles/Audi.png"),
				preload("res://Images/Vehicles/Black_viper.png"),
				preload("res://Images/Vehicles/Car.png"),
				preload("res://Images/Vehicles/Mini_truck.png"),
				preload("res://Images/Vehicles/Mini_van.png"),
				preload("res://Images/Vehicles/Police.png"),
				preload("res://Images/Vehicles/taxi.png"),
				preload("res://Images/Vehicles/truck.png")]

func _ready():
	set_texture(images[round(rand_range(0,8))])
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
