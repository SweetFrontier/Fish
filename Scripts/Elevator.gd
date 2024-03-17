extends Area2D


var fish_here : bool = false
var moving_down : bool = false	


func _physics_process(delta):
	if (moving_down):
		$"../AnimationPlayer".play("level_down")
		moving_down = false


func _input(event):
	if (fish_here and Input.is_key_pressed(KEY_F)):
		$TextureRect.texture = load("res://Art/Elevator/ElevatorClosed.png")
		$TextureRect.z_index = 11
		$"../Blocker/FloorCollision".disabled = true
		$"../Blocker/BucketCollision".disabled = false
		moving_down = true
		$TextureRect2.visible = true


func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (body.name == "Fish"):
		fish_here = true


func _on_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if (body.name == "Fish"):
		fish_here = false


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if (anim_name == "level_down"):
		$Node.visible = true
