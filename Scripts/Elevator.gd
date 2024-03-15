extends Area2D


var fish_here : bool = false
var moving_down : bool = false	

func _physics_process(delta):
	if (moving_down):
		$"../AnimationPlayer".play("level_down")

func _input(event):
	if (fish_here and Input.is_key_pressed(KEY_F)):
		$"../Blocker/CollisionPolygon2D".disabled = false

func _on_body_entered(body):
	fish_here = true


func _on_body_exited(body):
	fish_here = false
