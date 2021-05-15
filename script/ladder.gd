extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_Area2D_body_entered(body):
	if body.name == "gameboy":
		body._body_entered_ladder()
	

func _on_Area2D_body_exited(body):
	if body.name == "gameboy":
		body._body_exited_ladder()
