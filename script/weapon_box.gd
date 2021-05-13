extends Node2D

var player
var closed = true
var timeToaddDestination : float

func _ready() -> void:
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("action"):
		if closed == true:
			$SoundOpen.play()
			yield(get_tree().create_timer(5),"timeout")
			$AnimatedSprite.play()
			player.Picked = player.Picked + 1
			closed = false

func _on_Area2D_body_entered(body):
	if body.name == 'gameboy':
		player = body
		set_process(true)

func _on_Area2D_body_exited(body):
	if body.name == 'gameboy':
		set_process(false)
