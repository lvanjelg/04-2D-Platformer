extends Control


func _ready():
	pass


func _on_Quit_pressed():
	get_tree().quit()


func _on_Resume_pressed():
	var menu = get_node_or_null("/root/Game/UI/Menu")
	if menu != null:
		if menu.visible:
			menu.hide()
			get_tree().paused = false
