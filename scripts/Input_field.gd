extends Node2D

var password = ""
var trials = 3

func _ready():
	$Trials.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ColorRect/Input_field_label.add_color_override("font_color", Color.black)
	$ColorRect/Input_field_label.text = password


func _on_Button_pressed():
	password = password + "0"


func _on_Minimize_pressed():
	var tab = $ColorRect.get_parent()
	tab.visible = false

func _on_Button_entf_pressed():
	password.erase(password.length()-1,1)


func _on_Button_enter_pressed():
	var tutorial_node = get_parent().get_parent().get_parent()
	var solution = tutorial_node.getPassword()
	
	if(solution == password):
		var tab = $ColorRect.get_parent()
		tab.visible = false
		$Trials.clear()
		var message = "Ihr habt das Level geschafft"
		tutorial_node.setCongratMessage(message)
		
	else:
		$Trials.clear()
		$Trials.add_text("Das war leider falsch. Versuch es gerne nochmal. Du hast noch ")
		$Trials.push_color(Color.green)
		$Trials.add_text(str(trials))
		$Trials.push_color(Color.red)
		$Trials.add_text(" Versuche übrig. Für jeden Versuch gibt es 10 Sekunden Strafe.")
		$Trials.visible = true
		$TrialTimer.start()
		
		if(trials == 1):
			$Trials.add_text("Die Lösung versteckt sich in einem Instagrampost, der sein Geburtsdatum als Passwort benutzt")
			
		if(trials == 0):
			password = solution
			var time = tutorial_node.getTime()
			time += 60
			tutorial_node.setTime(time)
			$TrialTimer.stop()
			$Trials.clear()
			$Trials.add_text("Da du keine Versuche mehr hast gibt es eine Minute Strafe. Drücke ")
			$Trials.push_color(Color.green)
			$Trials.add_text("Enter")
			$Trials.push_color(Color.red)
			$Trials.add_text(" um fortzufahren")
			
		trials = trials - 1


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

func _on_TrialTimer_timeout():
	$Trials.visible = false
	$Trials.clear()
	
