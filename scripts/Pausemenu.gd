extends ColorRect


var is_paused = false setget set_is_paused


func set_is_paused(value):
	is_paused = value 
	get_tree().paused = is_paused
	visible = is_paused



func _on_WeiterButton_pressed():
	self.is_paused = false


func _on_OptionsButton_pressed():
	$CenterContainer/Menu1.visible = false
	$CenterContainer/Optionen.visible = true
	$Menu_Swap.play()


func _on_QuitButton_pressed():
	SceneTransition.change_scene("res://scenes/hauptmenu.tscn")
	self.is_paused = false


func _on_ZurckButton_pressed():
	$CenterContainer/Menu1.visible = true
	$CenterContainer/Optionen.visible = false
	$Menu_Swap.play()


func _on_Pause_pressed():
	self.is_paused = !is_paused
	
func _on_Master_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)


func _on_Music_value_changed(value):
	AudioServer.set_bus_volume_db(1, value)

func _on_SFX_value_changed(value):
	AudioServer.set_bus_volume_db(2, value)


func _on_Fullscreen_toggled(button_pressed):
	OS.window_fullscreen = button_pressed

