extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(false)

func _process(_delta) -> void:
	$Explotion2.play("explosion")
	$toxic_can.hide()

func _on_Area2D_body_entered(body):
	if(body.name == "bullet"):
		set_process(true)
		$blast.play()

func _on_Explotion2_animation_finished():
	queue_free()
