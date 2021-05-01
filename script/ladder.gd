extends Node2D

var gameboy = preload("res://scenes/gameboy.tscn")
var gameboy_instance = gameboy.instance()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name == "gameboy":
		#print("ladder yes")
		body._body_entered_ladder()
	#gameboy_instance.ladder_on = true
	#emit_signal("ladder_on")
	

func _on_Area2D_body_exited(body):
	if body.name == "gameboy":
		#print("ladder no")
		body._body_exited_ladder()
	#gameboy_instance.ladder_on = false
