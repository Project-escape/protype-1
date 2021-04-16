extends KinematicBody2D
var velocity = Vector2(0,0)
var coins = 0
var cover = false
var ladder_on = false
const SPEED = 350
var GRAVITY = 35
const JUMPFORCE = -1100

func _physics_process(_delta):
	#var ladder = get_tree().get_root().find_node("ladder",true,false)
	#ladder.connect("ladder_on",self,"_body_enter_ladder")
	if ladder_on == true:
		if Input.is_action_pressed("up") :
			print("up")
			velocity.y = -SPEED
		elif Input.is_action_pressed("down") :
			print("down")
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
		$Sprite/vest.flip_h = false
		$"Sprite/head phone military".flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
		$Sprite/vest.flip_h = true
		$"Sprite/head phone military".flip_h = true
	else:
		$Sprite.play("idle")
	if not is_on_floor():
		$Sprite.play("air")
		
	velocity.y = velocity.y + GRAVITY
	if Input.is_action_just_pressed("jump") and is_on_floor() :
		velocity.y = JUMPFORCE
		$SoundJump.play()
		
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
	
func _on_fallzone_body_entered(body):
	get_tree().change_scene("res://gameover.tscn")

func bounce():
	velocity.y = JUMPFORCE * 0.7

func ouch(var enemyposx):
	set_modulate(Color(1,0.3,0.3,0.3))
	$SoundHurt.play()
	velocity.y = JUMPFORCE * 0.5
	
	if position.x < enemyposx:
		velocity.x = -800
	elif position.x > enemyposx:
		velocity.x = 800
	Input.action_release("left")
	Input.action_release("right")
	$Timer.start()
	
func _body_entered_ladder():
	GRAVITY = 0
	ladder_on = true

func _body_exited_ladder():
	GRAVITY = 35
	ladder_on = false
