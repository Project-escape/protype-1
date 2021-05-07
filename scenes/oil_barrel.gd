extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(false)

func _process(_delta) -> void:
	$RigidBody2D/CollisionShape2D.set_disabled(true)

func _on_Area2D_body_entered(body):
	if(body.name == "bullet"):
		set_process(true)
		
