extends RigidBody2D

export var bullet_speed = 1000
export var fire_rate = 0.4
var bullets = 3
var bullet = preload("res://scenes/objects/bullet.tscn")
var can_fire = true

func _process(_delta):
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("right"):
		$gun.flip_v = false
		$BulletPoint.position = Vector2(180,-35)
	elif Input.is_action_pressed("left"):
		$gun.flip_v = true
		$BulletPoint.position = Vector2(180,35)
	if Input.is_action_pressed("fire") and can_fire and bullets > 0 :
		#$ShakingCamera.shake = true
		$SoundShot.play()
		bullets = bullets - 1
		var bullet_instance = bullet.instance()
		bullet_instance.position = $BulletPoint.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate),"timeout")
		can_fire = true
	elif Input.is_action_just_pressed("fire") and bullets <= 0:
		$SoundEmpty.play()
		yield(get_tree().create_timer(fire_rate),"timeout")

