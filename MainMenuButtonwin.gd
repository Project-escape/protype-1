extends Button


func _ready():
	pass


func _on_MainMenuButtonwin_pressed():
	get_tree().change_scene("res://TitleMenu.tscn")
	$WinPressed.play()
	
