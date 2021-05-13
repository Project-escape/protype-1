extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(false)

func _process(_delta) -> void:
	queue_free()

func _on_Area2D_body_entered(body):
	if(body.name == "bullet"):
		set_process(true)
		
