extends Area2D


var fish_here : bool = false
var moving_down : bool = false	


func _physics_process(delta):
	if (moving_down):
		$"../AnimationPlayer".play("level_down")
		moving_down = false


func _input(event):
	if (fish_here and Input.is_key_pressed(KEY_F)):
		$TextureRect.texture = load("res://Art/ElevatorClosed.png")
		$TextureRect.z_index = 11
		$"../Blocker/FloorCollision".disabled = true
		$"../Blocker/BucketCollision".disabled = false
		moving_down = true


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	fish_here = true


func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	fish_here = false
