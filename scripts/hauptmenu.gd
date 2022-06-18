extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	$"BGM Menu".play()


func _on_Level1Button_pressed():
	pass # Replace with function body.


func _on_TutorialButton_pressed():
	#$Tutorial._ready()
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
