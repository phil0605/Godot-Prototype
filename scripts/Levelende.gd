extends ColorRect


var is_paused = false setget set_is_paused
var inTime


func set_is_paused(value):
	is_paused = value 
	get_tree().paused = is_paused
	visible = is_paused


func show_end(time):
	if (time >= 20*60):
		$CenterContainer/Menu1/Ergebnis.text = "Zeitüberschreitung!"
		$CenterContainer/Menu1/Text.text = "Score 0"
		inTime = false
	else:
		var score = 1000 - (int(int(time) / 6) * 5)
		var text = "Score " + str(score)
		$CenterContainer/Menu1/Ergebnis.text = "Fall gelöst!"
		$CenterContainer/Menu1/Text.text = text
		inTime = true
	self.visible = true
	

func _on_QuitButton_pressed():
	if (inTime):
		SceneTransition.change_scene("res://scenes/Comic1Ende.tscn")
	else:
		SceneTransition.change_scene("res://scenes/hauptmenu.tscn")
	self.is_paused = false
	#self.visible = false

