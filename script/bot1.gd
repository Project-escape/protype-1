extends KinematicBody2D

var SPEED = 350
var velocity = Vector2(0,0)
var GRAVITY = 35
var INERTIA = 350
const JUMPFORCE = -1100
var cover = false
var ALIVE = true

func _physics_process(_delta):
	if !ALIVE:
		queue_free()
	if Input.is_action_pressed("sprint"):
		SPEED = 900
	else:
		SPEED = 350
	if $left_ray.is_colliding():
	#if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
		$vest.flip_h = false
		$"head phone military".flip_h = false
	elif $right_ray.is_colliding():
	#elif Input.is_action_pressed("left"):
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
	velocity.x = lerp(velocity.x,0,0.2)
	velocity = move_and_slide(velocity, Vector2.UP, false, 4, 0.785398, false)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("bodies"):
			collision.collider.apply_central_impulse(-collision.normal * INERTIA)

func _integrate_forces(state):
	print("state")
	var delta = state.get_step()
	# Steer towards player
	var distance_to_player = global_position.distance_to($"root/Global/".gameboy.global_position)
	var vector_to_player = ($"root/Global/".gameboy.global_position - global_position).normalized()
	print(distance_to_player)
	if distance_to_player > 150:
		# Move towards player
		velocity += vector_to_player * SPEED * delta
		$Sprite.play("walk")
		$Sprite.flip_h = false
		$vest.flip_h = false
		$"head phone military".flip_h = false
		#hovering = false
	else:
		# Move away from player
		#hovering = false
		velocity += -vector_to_player * SPEED * delta

func hide():
		if cover == false:
			#$SoundCardboard.play()
			cover = true
			$"cardboard box".show()
		elif cover == true:
			#$SoundCardboardOpen.play()
			cover = false
			$"cardboard box".hide()

func jump():
	if is_on_floor() :
		velocity.y = JUMPFORCE
		$SoundJump.play()
