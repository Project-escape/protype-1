extends Area2D

var closed = true
var area_entered = false

func _ready():
	connect("body_entered", self, "body_entered")
	connect("process", self, "_process")

func _process(delta):
		if area_entered == true && Input.is_action_just_pressed("action"):
			$Door.play()
			if closed == true:
				$StaticBody2D/CollisionShape2D.set_disabled(true)
				$AnimatedSprite.play("open_door")
				closed = false
			elif closed == false:
				$StaticBody2D/CollisionShape2D.set_disabled(false)
				$AnimatedSprite.play("close_door")
				closed = true

func body_entered(body):
	print("yes")
	area_entered = true	
	
func body_exited(body):
	print("no")
	area_entered = false

