extends Sprite

onready var animation = $AnimationPlayer;

func _ready():
	animation.current_animation = "Explosion";
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
