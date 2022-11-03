extends Area2D


func _ready():
	pass

func _on_Door2_body_entered(body):
	if Global.level == 2 and body.name == "Player":
		Global.level = 3
		var _s = get_tree().change_scene("res://Levels/Level3.tscn")
