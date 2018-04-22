extends Area2D

func _ready():
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$AnimatedSprite.animation = "go"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = false
		if ($AnimatedSprite.frame == 0):
			$AnimatedSprite.frame = 1
		else:
			$AnimatedSprite.frame = 0
