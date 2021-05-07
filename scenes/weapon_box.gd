extends Node2D

var closed = true
var timeToaddDestination : float

func _ready() -> void:
	set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("action"):
		if closed == true:
			yield(get_tree().create_timer(2),"timeout")
			$AnimatedSprite.play()

func _on_Area2D_body_entered(body):
	if body.name == 'gameboy':
		set_process(true)


func _on_Area2D_body_exited(body):
	if body.name == 'gameboy':
		set_process(false)
