extends KinematicBody2D

var start_pos = Vector2(1650,-100)
var player = get_node_or_null("res://Game/Player_Container/Player")
var nav = get_node_or_null("res://Game/Navigation2D")

var speed = 150

func _ready():
	position = start_pos

func _physics_process(_delta):
	if nav == null:
		nav = get_node_or_null("/root/Game/Navigation2D")
	elif player == null:
		player = get_node_or_null("/root/Game/Player_Container/Player")
	else:
		var points = nav.get_simple_path(global_position, player.global_position, true)
		if points.size() > 1:
			var target = points[1] - global_position
			var s = speed
			if target.length() > speed:
				s = target.length()
			if abs(s) < 1:
				s = 0
			var dir = target.normalized()
			if dir.x < 0:
				$Sprite.flip_h = true
			else:
				$Sprite.flip_h = false
			var _v = move_and_slide(dir*s,Vector2.ZERO)

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.die()
		queue_free()
