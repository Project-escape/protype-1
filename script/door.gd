extends Node2D

var closed = true

func _process(delta):
		if Input.is_action_just_pressed("action"):
			$Door.play()
			if closed == true:
				$StaticBody2D/CollisionShape2D.set_disabled(true)
				$AnimatedSprite.play("open_door")
				closed = false
			elif closed == false:
				$StaticBody2D/CollisionShape2D.set_disabled(false)
				$AnimatedSprite.play("close_door")
				closed = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



