extends RigidBody2D

var explotion = preload("res://scenes/objects/explotion.tscn")

func _on_RigidBody2D_body_entered(body):
	if body.is_in_group("characters"):
		body.ALIVE = false
	var explotion_instance = explotion.instance()
	explotion_instance.position = get_global_position()
	get_tree().get_root().add_child(explotion_instance)
	queue_free()
