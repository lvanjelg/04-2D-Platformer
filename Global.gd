extends Node

var score = 0
var lives = 5
var timer = 60
var level = 1

func _unhandled_input(_event):
	if Input.is_action_pressed("quit"):
		var menu = get_node_or_null("/root/Game/UI/Menu")
		if menu != null:
			if not menu.visible:
				menu.show()
				get_tree().paused = true
			else:
				menu.hide()
				get_tree().paused = false
		
func increase_score(s):
	score += s
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_score()
