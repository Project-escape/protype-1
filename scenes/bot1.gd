extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _integrate_forces(state):
	var delta = state.get_step()
	
	# Steer towards player
	#var distance_to_player = global_position.distance_to(gameboy.global_position)
	#var vector_to_player = (Game.player.global_position - global_position).normalized()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
