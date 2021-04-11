extends Node2D

onready var light = get_node("roomlight/Light2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	light.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	light.visible = false


func _on_lightsensor_body_entered(body):
	light.visible = true
