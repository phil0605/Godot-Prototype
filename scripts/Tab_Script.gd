extends Node2D

var selected = false
var touchpos = 0
onready var parent = get_node("../")
var reset = 0


#func _physics_process(delta):
#	if selected:
#		global_position = lerp(global_position, touchpos, 25 * delta)
	

func _on_CloseBox_input_event(_viewport, event, _shape_idx): #muss eventuell umbenannt werden
	if event is InputEventScreenTouch:
		self.visible = false
	if Input.is_action_just_pressed("press"):
		self.visible =false

func make_visible():
	self.visible = true


func _on_MoveBox_input_event(_viewport, event, _shape_idx):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			selected = true
		
	#if selected:
	#	touchpos = event.position
		
	if event is InputEventScreenTouch:
		if not event.is_pressed():
			selected = false
	
	if event is InputEventScreenDrag and selected:
		parent.raise()
		global_position += event.relative
		
		


func _on_Area2D_body_entered(body):
	if body == $Body:
		reset = global_position
	if body == $reset:
		global_position = reset
	
	
