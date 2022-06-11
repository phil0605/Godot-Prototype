extends CanvasLayer

signal start_game

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
