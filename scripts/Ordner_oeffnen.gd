extends Node2D

onready var tab_node = get_node("../Tab") #Pfad eventuell anpassen


func _on_OpenBox_input_event(_viewport, event, _shape_idx): #muss eventuell umbenannt werden
	if event is InputEventScreenTouch:
		tab_node.make_visible()
		flash()
	if Input.is_action_just_pressed("press"):
		tab_node.make_visible()
		flash()
	

func flash():
	$FileRed.material.set_shader_param("flash_modifier", 0.5)
	$Flash_timer.start()

func _on_Flash_timer_timeout():
	$FileRed.material.set_shader_param("flash_modifier", 0)
