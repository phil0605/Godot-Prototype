extends Control

#Einführung
var dialog1 = ["Willkommen ihr Daten Detektive! (tippe)", 
			   "Das hier ist dein erster Fall oder?", 
			   "Gut, dann zeig ich dir mal ein paar Grundlagen!"]

#Erklärung Timer und Score
var dialog2 = ["Das da oben ist ein Timer.", 
				"Der zeigt euch an, wie lange ihr für diesen Fall bisher gebraucht habt.",
				"Außerdem fällt eure Belohnung am Ende größer aus, wenn ihr schnell seid.",
				"Die Zeit läuft, sobald euer Fall startet.",
				"Gehen wir zu nächsten Punkt über."]

#Übergang Ordner1
var dialog3 = ["Tippe auf diesen Ordner!"]

#Erklärung Tabs
var dialog4 = ["Dieses Fenster kannst du beliebig bewegen und wieder schließen bzw öffnen!",
				 "Aber das wichtigste ist, dass du aus ihnen Informationen herausziehen kannst."]

#Übergang Ordner Rot
var dialog5 = [ "Dies hier ist die zweite Art von Ordner. Tippe diesen doch auch mal an!"]

#Erklärung Passwort, Versuche/Hilfe und Start für Fall
var dialog6 = ["Bla Bla Bla",
				"Bla Bla Bla",
				"Bla Bla Bla",
				"Das war alles, was ich euch beibringen kann, ab jetzt seid ihr auf euch alleine gestellt.",
				"Jetzt geht es los, viel Erfolg!"]

var page1 = 0
var page2 = 0
var page3 = 0
var page4 = 0
var page5 = 0
var page6 = 0

var finished = false

var Teil1 = true
var Teil2 = false
var Teil3 = false
var Teil4 = false
var Teil5 = false
var Teil6 = false

onready var Or1L = get_node("../BackgroundLeft/Ordner_Links_2/Ordner")
onready var Or1R = get_node("../BackgroundRight/Ordner_Rechts_2/Ordner")
onready var Or2L = get_node("../BackgroundLeft/Ordner_Links_1/Ordner")
onready var Or2R = get_node("../BackgroundRight/Ordner_Rechts_1/Ordner")
onready var OrRotL = get_node("../BackgroundLeft/Ordner_Links_Rot/Ordner")
onready var OrRotR = get_node("../BackgroundRight/Ordner_Rechts_Rot/Ordner")

onready var IFR = get_node("../BackgroundRight/Ordner_Rechts_Rot/Tab")
onready var IFL = get_node("../BackgroundLeft/Ordner_Links_Rot/Tab")
onready var main = get_node("../")


#onready var area = get_node("../Area2D")
#onready var or_area = get_node("../Tut_Ordner_Box")

# Called when the node enters the scene tree for the first time.
func start_now():
	load_dialog1()
	
func _process(_delta):
	$DialogPfeil2.visible = finished
	$DialogPfeil.visible = finished

func _on_Tween_tween_completed(_object, _key):
	finished = true

func _on_TutBox_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		if Teil1 == true:
			load_dialog1()
		elif Teil2 == true:
			load_dialog2()
		elif Teil3 == true:
			load_dialog3()
		elif Teil4 == true:
			load_dialog4()
		elif Teil5 == true:
			load_dialog5()
		elif Teil6 == true:
			load_dialog6()
	if Input.is_action_just_pressed("press"):
		if Teil1 == true:
			load_dialog1()
		elif Teil2 == true:
			load_dialog2()
		elif Teil3 == true:
			load_dialog3()
		elif Teil4 == true:
			load_dialog4()
		elif Teil5 == true:
			load_dialog5()
		elif Teil6 == true:
			load_dialog6()
		
func _on_Or1Box_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		$PfeilOr1.visible = false
		$Or1Box.visible = false
		next_dialog3()
	if Input.is_action_just_pressed("press"):
		$PfeilOr1.visible = false
		$Or1Box.visible = false
		next_dialog3()

func _on_Or2Box_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch:
		$Or2Box.visible = false
		$PfeilOrRot.visible = false
		next_dialog5()
	if Input.is_action_just_pressed("press"):
		$Or2Box.visible = false
		$PfeilOrRot.visible = false
		next_dialog5()

func next_dialog1():
	Teil1 = false
	Teil2 = true
	load_dialog2()
	
func next_dialog2():
	Teil2 = false
	Teil3 = true
	load_dialog3()
	
func next_dialog3():
	Teil3 = false
	Teil4 = true
	load_dialog4()

func next_dialog4():
	Teil4 = false
	Teil5 = true
	load_dialog5()

func next_dialog5():
	Teil5 = false
	Teil6 = true
	load_dialog6()

func load_dialog1():
	if page1 < dialog1.size():
		if $RichTextLabel.percent_visible == 1:
			finished = false
			$RichTextLabel.bbcode_text = dialog1[page1]
			$RichTextLabel2.bbcode_text = dialog1[page1]
			$RichTextLabel.percent_visible = 0
			$RichTextLabel2.percent_visible = 0
			$Tween.interpolate_property(
				$RichTextLabel, "percent_visible", 0, 1, 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
			$Tween.interpolate_property(
				$RichTextLabel2, "percent_visible", 0, 1, 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
			$Tween.start()
			page1 += 1

	elif $RichTextLabel.percent_visible == 1:
		#Or1L.visible = true
		#Or2R.visible = true
		$PfeilTime.visible = true
		next_dialog1()

func load_dialog2():
	if page2 < dialog2.size():
		if $RichTextLabel.percent_visible == 1:
			finished = false
			$RichTextLabel.bbcode_text = dialog2[page2]
			$RichTextLabel2.bbcode_text = dialog2[page2]
			$RichTextLabel.percent_visible = 0
			$RichTextLabel2.percent_visible = 0
			$Tween.interpolate_property(
				$RichTextLabel, "percent_visible", 0, 1, 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
			$Tween.interpolate_property(
				$RichTextLabel2, "percent_visible", 0, 1, 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
			$Tween.start()
			page2 += 1
			
	elif $RichTextLabel.percent_visible == 1:
		Or1L.visible = true
		Or1R.visible = true
		$Or1Box.visible = true
		$PfeilTime.visible = false
		$PfeilOr1.visible = true
		next_dialog2()

func load_dialog3():
	if page3 < dialog3.size():
		if $RichTextLabel.percent_visible == 1:
			finished = false
			$RichTextLabel.bbcode_text = dialog3[page3]
			$RichTextLabel2.bbcode_text = dialog3[page3]
			$RichTextLabel.percent_visible = 0
			$RichTextLabel2.percent_visible = 0
			$Tween.interpolate_property(
				$RichTextLabel, "percent_visible", 0, 1, 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
			$Tween.interpolate_property(
				$RichTextLabel2, "percent_visible", 0, 1, 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
			$Tween.start()
			page3 += 1
			
	elif $RichTextLabel.percent_visible == 1:
		pass

func load_dialog4():
	if page4 < dialog4.size():
		if $RichTextLabel.percent_visible == 1:
			finished = false
			$RichTextLabel.bbcode_text = dialog4[page4]
			$RichTextLabel2.bbcode_text = dialog4[page4]
			$RichTextLabel.percent_visible = 0
			$RichTextLabel2.percent_visible = 0
			$Tween.interpolate_property(
				$RichTextLabel, "percent_visible", 0, 1, 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
			$Tween.interpolate_property(
				$RichTextLabel2, "percent_visible", 0, 1, 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
			$Tween.start()
			page4 += 1
				
	elif $RichTextLabel.percent_visible == 1:
		$Or2Box.visible = true
		OrRotL.visible = true
		OrRotR.visible = true
		$PfeilOrRot.visible = true
		next_dialog4()

func load_dialog5():
	if page5 < dialog5.size():
		if $RichTextLabel.percent_visible == 1:
			finished = false
			$RichTextLabel.bbcode_text = dialog5[page5]
			$RichTextLabel2.bbcode_text = dialog5[page5]
			$RichTextLabel.percent_visible = 0
			$RichTextLabel2.percent_visible = 0
			$Tween.interpolate_property(
				$RichTextLabel, "percent_visible", 0, 1, 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
			$Tween.interpolate_property(
				$RichTextLabel2, "percent_visible", 0, 1, 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
			$Tween.start()
			page5 += 1
			
	elif $RichTextLabel.percent_visible == 1:
		pass

func load_dialog6():
	if page6 < dialog6.size():
		if $RichTextLabel.percent_visible == 1:
			finished = false
			$RichTextLabel.bbcode_text = dialog6[page6]
			$RichTextLabel2.bbcode_text = dialog6[page6]
			$RichTextLabel.percent_visible = 0
			$RichTextLabel2.percent_visible = 0
			$Tween.interpolate_property(
				$RichTextLabel, "percent_visible", 0, 1, 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
			$Tween.interpolate_property(
				$RichTextLabel2, "percent_visible", 0, 1, 1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
			)
			$Tween.start()
			page6 += 1
			
	elif $RichTextLabel.percent_visible == 1 and page6 >= dialog6.size():
		Or2L.visible = true
		Or2R.visible = true
		IFR.tutorial_end()
		IFL.tutorial_end()
		main.start_now()
		main.tutorial_end()
		self.visible = false

