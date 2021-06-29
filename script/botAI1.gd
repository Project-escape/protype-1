extends Node2D

signal state_changed(new_state)

enum State {
	HIDE,
	CHASE,
	ATTACK,
	ACCESS,
}

onready var player_detection_zone = $player_detection_zone

var current_state = State.HIDE setget set_state
var player
var ACCESS = false
var machine
#var bot_gun = $"/root/Global".gun.instance()

func _process(_delta):
	match current_state:
		State.HIDE:
			get_parent().get_node('gun').bullets = 0
			get_parent().HIDE = true
		State.CHASE:
			pass
		State.ATTACK:
			if get_parent().cover == true:
				get_parent().hide()
			get_parent().get_node('gun').attack()
		State.ACCESS:
			if ACCESS == true:
				machine.Player = get_parent()	
				if machine.ACCESS == false:
					machine.ACCESS = true
				set_state(State.HIDE)

func set_state(new_state: int):
	if new_state == current_state:
		return
		
	current_state = new_state
	emit_signal("state_changed", current_state)

func _on_player_detection_zone_body_entered(body):
	if body.name == "gameboy":
		get_parent().get_node('gun').bullets = 5
		set_state(State.ATTACK)
		player = body

func _on_AccessRange_area_entered(area):
	if area.is_in_group("machines"):
		set_state(State.ACCESS)
		ACCESS = true
		machine = area


func _on_player_detection_zone_body_exited(body):
	if body.name == "gameboy":
		set_state(State.HIDE)
