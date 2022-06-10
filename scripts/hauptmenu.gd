extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_Level1Button_pressed():
	pass # Replace with function body.


func _on_TutorialButton_pressed():
	$Tutorial._ready()
	$Tutorial.visible = true
	
