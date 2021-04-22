extends KinematicBody2D

var velocity = Vector2(0,0)
var coins = 0
var cover = false
var ladder_on = false
#var wall =  preload("res://scenes/levels/levelsample.tscn")

var SPEED = 350
var GRAVITY = 35
var INERTIA = 350
const JUMPFORCE = -1100

func _physics_process(_delta):
	#var ladder = get_tree().get_root().find_node("ladder",true,false)
	#ladder.connect("ladder_on",self,"_body_enter_ladder")
	if Input.is_action_pressed("sprint"):
		SPEED = 900
	else:
		SPEED = 350
	if ladder_on == true:
		if Input.is_action_pressed("up") :
			#print("up")
			velocity.y = -SPEED
		elif Input.is_action_pressed("down") :
			#print("down")
			velocity.y = +SPEED
		else:
			$Sprite.play("idle")
		if not is_on_floor():
			$Sprite.play("air")
	if Input.is_action_just_pressed("cover"):
		if cover == false:
			$SoundCardboard.play()
			cover = true
			$"cardboard box".show()
		elif cover == true:
			$SoundCardboardOpen.play()
			cover = false
			$"cardboard box".hide()
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
		$vest.flip_h = false
		$"head phone military".flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
		$vest.flip_h = true
		$"head phone military".flip_h = true
	else:
		$Sprite.play("idle")
	if not is_on_floor():
		$Sprite.play("air")
		
	velocity.y = velocity.y + GRAVITY
	if Input.is_action_just_pressed("jump") and is_on_floor() :
		velocity.y = JUMPFORCE
		$SoundJump.play()
	velocity.x = lerp(velocity.x,0,0.2)
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, 0.785398, false)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("bodies"):
			collision.collider.apply_central_impulse(-collision.normal * INERTIA)

func _on_fallzone_body_entered(body):
	get_tree().change_scene("res://gameover.tscn")

func bounce():
	$Soundland.play()
	velocity.y = JUMPFORCE * 0.7
	
func _body_entered_ladder():
	GRAVITY = 0
	ladder_on = true

func _body_exited_ladder():
	GRAVITY = 35
	ladder_on = false

func fall_left_reset():
	#var Wall_instance = wall.instance()
	var player_instance = get_node(".")
	player_instance.position.x = 0
#Vector2(450,0)
	get_parent().call_deferred("add_child", player_instance)
	
func fall_right_reset():
	#var Wall_instance = wall.instance()
	var player_instance = get_node(".")
	player_instance.position.x = 12916.983
#Vector2(450,0)
	get_parent().call_deferred("add_child", player_instance)
	
func fall_y_reset():
	#var Wall_instance = wall.instance()
	var player_instance = get_node(".")
	player_instance.position.y = 0
#Vector2(450,0)
	get_parent().call_deferred("add_child", player_instance)

func _on_right_resetter_body_entered(body):
	#if body.name == "Node2D2":
	$SoundAaaahhh.play()
	fall_left_reset()

func _on_down_resetter_body_shape_entered(body_id, body, body_shape, area_shape):
	$SoundAaaahhh.play()
	fall_y_reset()

func _on_left_resetter_body_entered(body):
	#if body.name == "Node2D2":
	$SoundAaaahhh.play()
	fall_right_reset()
