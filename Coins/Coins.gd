extends Node2D

export var score = 10

func _ready():
	pass


func _on_Coins_body_entered(body):
	if body.name == "Player":
		Global.increase_score(score)
		queue_free()
