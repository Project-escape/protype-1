extends Node2D

onready var area: Area2D = $AreaDetector
var closed = false

func _ready() -> void:
	set_process(false)

func _process(delta) -> void:
		if Input.is_action_just_pressed("action"):
			$Door.play()
			if closed == true:
				$StaticBody2D/CollisionShape2D.set_disabled(true)
				$AnimatedSprite.play("open_door")
				#var doorlight = get_node("res://scenes/rooms/room 3.tscn")
				#doorlight.roomlight.Light2D.enabled = false
				#doorlight.roomlight.Light2D.enabled = false
				#var light = get_node("res://scenes/rooms/room 3.tscn").get_node("roomlight").get_node("Light2D")
				#Light2D.enabled = false
				closed = false
			elif closed == false:
				$StaticBody2D/CollisionShape2D.set_disabled(false)
				$AnimatedSprite.play("close_door")
				closed = true

func _on_AreaDetector_body_entered(body):
	if body.name == "gameboy":
		print("yes")
		set_process(true)


func _on_AreaDetector_body_exited(body):
	if body.name == "gameboy":
		print("no")
		set_process(false)
