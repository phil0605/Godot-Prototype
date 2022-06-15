extends Node2D

onready var tab_node = get_node("../Tab") #Pfad eventuell anpassen


func _on_OpenBox_input_event(_viewport, event, _shape_idx): #muss eventuell umbenannt werden
	if event is InputEventScreenTouch:
		tab_node.make_visible()
	if Input.is_action_just_pressed("press"):
		tab_node.make_visible()
	

