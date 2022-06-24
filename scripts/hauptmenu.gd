extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	$"BGM Menu".play()


func _on_Level1Button_pressed():
	SceneTransition.change_scene("res://scenes/Fall1.tscn")


func _on_TutorialButton_pressed():
	SceneTransition.change_scene("res://scenes/Tutorial.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_FlleButton_pressed():
	$CenterContainer/Menu1.visible = false
	$CenterContainer/Faelle.visible = true
	$Menu_Swap.play()


func _on_OptionsButton_pressed():
	$CenterContainer/Menu1.visible = false
	$CenterContainer/Options.visible = true
	$Menu_Swap.play()


func _on_BackButton_pressed():
	$CenterContainer/Faelle.visible = false
	$CenterContainer/Options.visible = false
	$CenterContainer/Menu1.visible = true
	$Menu_Swap.play()


func _on_Master_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)


func _on_Music_value_changed(value):
	AudioServer.set_bus_volume_db(1, value)

func _on_SFX_value_changed(value):
	AudioServer.set_bus_volume_db(2, value)


func _on_Fullscreen_toggled(button_pressed):
	OS.window_fullscreen = button_pressed


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		$AnimationPlayer.play("menu_start")
		$Area2D.visible = false
