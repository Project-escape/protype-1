extends Node2D

onready var portal = preload("res://scenes/machines/portal.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var random_generator = RandomNumberGenerator.new()
	random_generator.randomize()
	var random_value = random_generator.randf_range(1,14)
	var chest = "weapon_box" + String(int(random_value))
	print(chest)
	var portal_instance = portal.instance()
	portal_instance.position = get_node(chest).get_global_position()
	get_node(chest).free()
	get_tree().get_root().call_deferred("add_child", portal_instance)
