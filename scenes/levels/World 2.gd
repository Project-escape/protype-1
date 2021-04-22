extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func wall_reset():
	var Wall_instance = get_node(".")
	Wall_instance.position.x = Wall_instance.position.x + (12796*2)
	#Vector2(450,0)
	get_parent().call_deferred("add_child",Wall_instance )

func _on_Area2D_body_entered(body):
	if body.name == "gameboy":
		wall_reset()
		$Node2D.queue_free()
