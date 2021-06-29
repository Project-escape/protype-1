extends Node2D

signal state_changed(new_state)

enum State {
	HIDE,
	CHASE,
	ATTACK,
	ACCESS,
	WALK,
}

onready var player_detection_zone = $player_detection_zone

var current_state = State.HIDE setget set_state
var player
var ACCESS = false
var machine
#var bot_gun = $"/root/Global".gun.instance()

func _ready():
	set_state(State.WALK)

func _process(_delta):
	match current_state:
		State.HIDE:
			pass
		State.CHASE:
			pass
		State.ATTACK:
			get_parent().get_node('gun').attack()
		State.ACCESS:
			if ACCESS == true:
				machine.Player = get_parent()	
				if machine.ACCESS == false:
					machine.ACCESS = true
				set_state(State.WALK)
		State.WALK:
			if $left_ray.is_colliding() && get_parent().is_on_floor():
				get_parent().DIRECTION = 'right'
			elif $left_ray_down.is_colliding():
				get_parent().jump()
			if $right_ray.is_colliding() && get_parent().is_on_floor():
				get_parent().DIRECTION = 'left'
			elif $right_ray_down.is_colliding():
				get_parent().jump()
			get_parent().walk()

func set_state(new_state: int):
	if new_state == current_state:
		return

	current_state = new_state
	emit_signal("state_changed", current_state)

func _on_player_detection_zone_body_entered(body):
	if body.name == "gameboy":
		player = body
		set_state(State.ATTACK)

func _on_AccessRange_area_entered(area):
	if area.is_in_group("machines"):
		set_state(State.ACCESS)
		ACCESS = true
		machine = area
