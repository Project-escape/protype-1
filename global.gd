extends Node

var player
var object
var effect

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func register_player(in_player):
	print("Player registered")
	player = in_player
	
func register_object(in_object):
	print("object registered")
	object = in_object

func register_effect(in_effect):
	print("effect registered")
	effect = in_effect
