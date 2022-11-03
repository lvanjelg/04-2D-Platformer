extends Area2D


func _ready():
	pass


func _on_Door3_body_entered(body):
	if body.name == "Player":
		var end_screen = get_node_or_null("/root/Game/UI/End_Game")
		if end_screen != null:
			if not end_screen.visible:
				end_screen.show()
				get_tree().paused = true
