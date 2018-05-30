extends Area2D

var car;

func _ready():
	pass
	
func resumeCar():
	
	print("Resuming car...")
	
	if car != null:
		print("Car !");
		car.resume()
		car = null
	else:
		print("No car!");