extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Teil1 = true
var Teil2 = false
var Teil3 = false
var animation = ["zu_ Panel2", "zu_Panel3", "zu_Panel4"]
var page = 0 
var wait =false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			if wait == true:
				#if event.is_pressed():
					#if Teil1==true:
				
				next_ani()
				$Menu_Swap.play()
				$Timer.start()
				wait = false
		
func next_ani():
	if page < animation.size():
		$AnimationPlayer.play(animation[page])
		page+=1
	elif page>=animation.size():
		SceneTransition.change_scene("res://scenes/Tutorial.tscn")
	
	


func _on_Skip_pressed():
	SceneTransition.change_scene("res://scenes/Tutorial.tscn")


func _on_Timer_timeout():
	wait = true
