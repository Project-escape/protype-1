extends Node2D

var broken = false
var switch = false

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if body.name == 'gameboy' && broken == false && switch == false:
		switch = true
		$Light2D.show()
		$on.play()

func _on_hit_box_body_entered(body):
	if body.name == 'bullet' && broken == false:
		$break.play()
		$AnimatedSprite.play()
		$Light2D.hide()
		$StaticBody2D/CollisionPolygon2D.set_disabled(true)
		broken = true

func _on_Area2D2_body_exited(body):
	if body.name == 'gameboy' && switch == true:
		switch = false
		$Light2D.hide()
