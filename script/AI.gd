extends Node2D

signal state_changed(new_state)

enum State {
	HIDE,
	CHASE,
	ATTACK,
	DEFEND,
}

onready var player_detection_zone = $player_detection_zone

var current_state = State.HIDE setget set_state
var player
#var bot_gun = $"/root/Global".gun.instance()

func _process(_delta):
	match current_state:
		State.HIDE:
			get_parent().hide()
		State.CHASE:
			pass
		State.ATTACK:
			if get_parent().cover == true:
				get_parent().hide()
			if get_parent().get_node('gun').bullets > 0:
				get_parent().get_node('gun').attack()
				return
		State.DEFEND:
			pass

func set_state(new_state: int):
	if new_state == current_state:
		return
		
	current_state = new_state
	emit_signal("state_changed", current_state)


func _on_player_detection_zone_body_entered(body):
	if body.name == "gameboy":
		set_state(State.ATTACK)
		player = body
