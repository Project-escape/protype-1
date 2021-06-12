extends Node2D

var Player
var closed = true
var timeToaddDestination : float
var ACCESS = false
var allow = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if allow == true:
		if ACCESS == true:
			if closed == true:
				$SoundOpen.play()
				closed = false
				yield(get_tree().create_timer(5),"timeout")
				$AnimatedSprite.play("open")
				closed = false
			if closed == false:
				ACCESS = false
				$AnimatedSprite.play("close")
				$Timer.start()
				closed = true
				allow = false


func _on_Timer_timeout():
	allow = true
