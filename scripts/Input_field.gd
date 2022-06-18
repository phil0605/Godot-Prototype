extends Node2D

var password = ""
var trials = 3
var tutend = false

func _ready():
	$Trials.visible = false

func tutorial_end():
	tutend = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ColorRect/Input_field_label.add_color_override("font_color", Color.black)
	$ColorRect/Input_field_label.text = password
	
	# checks, whether time's up and we need to close the input_field
	if tutend == true:
		var tutorial_node = get_parent().get_parent().get_parent()
		var time = tutorial_node.getTime()
		var minutes:int   = int(time / 60.0) % 60
		if (minutes >= 20.0):
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
		var solution = tutorial_node.getPassword()
		var time = tutorial_node.getTime()
		$Trials.clear()
	
		if(solution == password):
			var tab = $ColorRect.get_parent()
			tab.visible = false
			tutorial_node.stopTime()
			
		else:
			$Trials.add_text("Das war leider falsch. Versuch es gerne nochmal. Du hast noch ")
			$Trials.push_color(Color.green)
			$Trials.add_text(str(trials))
			$Trials.push_color(Color.red)
			$Trials.add_text(" Versuche übrig. Für jeden Versuch gibt es 10 Sekunden Strafe.")
			$Trials.visible = true
			$TrialTimer.start()
			time += 10
			tutorial_node.setTime(time)
		
			if(trials == 1):
				$Trials.add_text("Die Lösung versteckt sich in einem Instagrampost, der sein Geburtsdatum als Passwort benutzt.")
			
			if(trials == 0):
				#password = solution
				time += 50
				tutorial_node.setTime(time)
				$Trials.clear()
			
				$Trials.add_text("Da keine Versuche mehr übrig sind, gibt es eine Minute Strafe. Deine Versuche werden zurückgesetzt.")
				trials = 3
				
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
	
