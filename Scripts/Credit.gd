extends TextureRect


func _input(event):
	if (Input.is_key_pressed(KEY_R)):
		get_tree().change_scene_to_file("res://Scenes/Screens/MainMenu.tscn")
