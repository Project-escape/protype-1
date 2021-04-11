extends Node2D

onready var light = get_node("roomlight/Light2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	light.enabled = false
	print("Light off")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	light.enabled = false
	print("Light off")


func _on_lightsensor_body_entered(body):
	light.enabled = true
	print("Light on")
