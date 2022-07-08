extends Node2D

var password = ""
var trials = 3
var tutend = false
onready var wrong = get_node("../../../Wrong/Wrong_Red")
onready var Textbox = get_node("../../../Textbox")

func _ready():
	$Trials.visible = false

func tutorial_end():
	tutend = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ColorRect/Input_field_label.add_color_override("font_color", Color.white)
	$ColorRect/Input_field_label.text = password
	
	# checks, whether time's up and we need to close the input_field
	if tutend == true:
		var tutorial_node = get_parent().get_parent().get_parent()
		var time = tutorial_node.getTime()
		var minutes:int   = int(time / 60.0) % 60
		if (minutes >= 15.0):
			var tab = $ColorRect.get_parent()
			tab.visible = false


func _on_Button_pressed():
	password = password + "0"


func _on_Minimize_pressed():
	var tab = $ColorRect.get_parent()
	tab.visible = false

func _on_Button_entf_pressed():
	password.erase(password.length()-1,1)


func _on_Button_enter_pressed():
	if tutend == true:
		var tutorial_node = get_parent().get_parent().get_parent()
		var solution = tutorial_node.getPassword_gelb()
		var time = tutorial_node.getTime()
	
		if(solution == password):
			var tab = $ColorRect.get_parent()
			tab.visible = false
			tutorial_node.next_phase()
			
		else:
			wrong.play("wrong")
			time += 10
			tutorial_node.setTime(time)
			
			if(trials == 3):
				Textbox.next_dialog2()
			
			if(trials == 2):
				Textbox.next_dialog3()

			
			if(trials == 1):
				Textbox.next_dialog4()
				time += 50
				tutorial_node.setTime(time)
				trials = 4
				
			trials -= 1


func _on_Button_1_pressed():
	password = password + "1"

func _on_Button_2_pressed():
	password = password + "2"


func _on_Button_3_pressed():
	password = password + "3"


func _on_Button_4_pressed():
	password = password + "4"


func _on_Button_5_pressed():
	password = password + "5"


func _on_Button_6_pressed():
	password = password + "6"


func _on_Button_7_pressed():
	password = password + "7"


func _on_Button_8_pressed():
	password = password + "8"


func _on_Button_9_pressed():
	password = password + "9"

	
func make_visible():
	var tab = $ColorRect.get_parent()
	tab.visible = true

func _on_TrialTimer_timeout():
	$Trials.visible = false
	$Trials.clear()
	
func _on_Button_clear_pressed():
	password = ""
