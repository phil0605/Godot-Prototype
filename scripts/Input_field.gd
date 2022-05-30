extends Tabs


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var password = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/Input_field_label.text = password


func _on_Button_pressed():
	password = password + "0"


func _on_Minimize_pressed():
	var tab = $CanvasLayer.get_parent()
	tab.visible = false # Replace with function body.
	
	var children = $CanvasLayer.get_children()
	
	for child in children.size():
		$CanvasLayer.get_child(child).hide()


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
	

func _on_TaschenrechnerIcon_pressed():
	hide()
	var children = $CanvasLayer.get_children()
	for child in children.size():
		$CanvasLayer.get_child(child).show()


func _on_Ordner_rot_links_pressed():
	var children = $CanvasLayer.get_children()
	
	show()
	for child in children.size():
		$CanvasLayer.get_child(child).show()
