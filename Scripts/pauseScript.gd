extends CanvasLayer

@export var PauseyArea : TextureRect
@export var AnimatPlayr : AnimationPlayer

var loadingStateChange : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pause_button_pressed():
	if (!loadingStateChange):
		loadingStateChange = true
		if (!get_tree().paused):
			get_tree().paused = true
			PauseyArea.visible = true
			AnimatPlayr.play("toPause")
		else:
			AnimatPlayr.play("out")
			await AnimatPlayr.animation_finished
			get_tree().paused = false
			PauseyArea.visible = false
		loadingStateChange = false
