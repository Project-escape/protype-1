extends Node2D

#onready var area: Area2D = $AreaDetector
var closed = true
var ACCESS = false

func _process(_delta):
	if ACCESS == true:
		$Door.play()
		if closed == true:
			$StaticBody2D/CollisionShape2D.set_disabled(true)
			$AnimatedSprite.play("open_door")
			closed = false
			ACCESS = false
		elif closed == false:
			$StaticBody2D/CollisionShape2D.set_disabled(false)
			$AnimatedSprite.play("close_door")
			closed = true
			ACCESS = false
