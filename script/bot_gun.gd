extends Node2D


var bullet = preload("res://scenes/objects/bullet.tscn")

export var bullet_speed = 1000
export var fire_rate = 0.4
var bullets = 3
var can_fire = true
var ATTACK = false 

func _process(_delta):
	look_at($"/root/Global".player.get_global_position())
	if Input.is_action_pressed("right"):
		$gun.flip_v = false
		$BulletPoint.position = Vector2(180,-35)
	elif Input.is_action_pressed("left"):
		$gun.flip_v = true
		$BulletPoint.position = Vector2(180,35)

func attack():
	while(bullets > 0):
		print("attack")
		bullets = bullets - 1
		print(can_fire)
		if can_fire == true:
			$SoundShot.play()
			print(bullets)
			var bullet_instance = bullet.instance()
			bullet_instance.position = $BulletPoint.get_global_position()
			bullet_instance.rotation_degrees = rotation_degrees
			bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
			get_tree().get_root().add_child(bullet_instance)
			can_fire = false
			yield(get_tree().create_timer(fire_rate),"timeout")
			can_fire = true
	$SoundEmpty.play()
	return
