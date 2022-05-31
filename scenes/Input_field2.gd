extends Tabs

var password = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ColorRect/Input_field_label.text = password


func _on_Button_pressed():
	password = password + "0"


func _on_Minimize_pressed():
	var tab = $ColorRect.get_parent()
	tab.visible = false # Replace with function body.
	
	#var children = $ColorRect.get_children()
	
	#for child in children.size():
		#$ColorRect.get_child(child).hide()


func _on_Button_entf_pressed():
	password.erase(password.length()-1,1)


func _on_Button_enter_pressed():
	return password


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


func _on_Tutorial_ready():
	_on_Minimize_pressed()
	

func _on_TR_links_pressed():
	show()
	var children = $ColorRect.get_children()
	for child in children.size():
		$ColorRect.get_child(child).show()
		
func _on_TR_rechts_pressed():
	_on_TR_links_pressed()
	
func make_visible():
	var tab = $ColorRect.get_parent()
	tab.visible = true


