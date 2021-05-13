extends AnimatedSprite

func _on_explotion_animation_finished():
	queue_free()
