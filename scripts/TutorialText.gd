extends Control

#Einführung
var dialog1 = ["Willkommen ihr Daten Detektive! (tippe)", 
			   "Das hier ist dein erster Fall oder?", 
			   "Gut, dann zeig ich dir mal ein paar Grundlagen!"]

#Erklärung Timer und Score
var dialog2 = ["Das da oben ist ein Timer.", 
				"Der zeigt euch an, wie lange ihr für diesen Fall bisher gebraucht habt.",
				"Je schneller ihr seid, desto höher fällt eure Belohnung am Ende aus.", 
				"Doch soltet ihr das jeweilige Zeitlimit überschreiten, seid ihr gescheitert. Hier sind es 20 Minuten.",
				"Die Zeit läuft, sobald euer Fall startet.",
				"Gehen wir zum nächsten Punkt über."]

#Übergang Ordner1
var dialog3 = ["Tippe auf diesen Ordner!"]

#Erklärung Tabs
var dialog4 = ["In jedem Ordner versteckt sich ein Fenster, dass du beliebig bewegen, wieder schließen und öffnen kannst!",
				 "Aber das Wichtigste ist, dass du aus ihnen Informationen herausziehen kannst."]

#Übergang Ordner Rot
var dialog5 = [ "Dies hier ist die zweite Art von Ordner. Tippe diesen doch auch mal an!"]

#Erklärung Passwort, Versuche/Hilfe und Start für Fall
var dialog6 = ["Das ist ein Eingabefeld. In dieses müsst ihr ein Passwort eingeben, um weiter zu kommen oder einen Fall zu lösen.",
				"Der rote Ordner ist immer der letzte Ordner eines jeden Levels.",
				"Doch Achtung! Für jeden Fehlversuch gibt es eine Zeitstrafe von 10 Sekunden.",
				"Nach drei gescheiterten Versuchen ist es sogar eine Starfminute. Seid also wachsam.",
				"Solange die Zeit noch nicht abgelaufen ist, habt ihr so viele Versuche wie ihr wollt.",
				"Das war alles, was ich euch beibringen kann, ab jetzt seid ihr auf euch alleine gestellt.",
				"Viel Erfolg! Die Zeit startet jetzt."]
				
var dialog7 = ["Schade, das war leider falsch! Aber kein Problem, wir haben noch 3 Versuche.",
				"Gebt jetzt nicht auf und macht weiter!"]
				
var dialog8 = ["Mist, schon wieder nicht richtig! Jetzt sind noch 2 Versuche übrig.",
				"Ich glaube ich habe eine Idee, beim nächsten Mal gebe ich euch ein Tipp!"]
				
var dialog9 = ["Okay das ist jetzt unser letzer Versuch, bevor wir 60 Sekunden verlieren.",
				"Ich vermute ganz stark, dass das Passwort das vollständige Geburtsdatum des Täters ist!",
				"Lasst jetzt bloß nicht den Kopf hängen!"]

var page1 = 0
var page2 = 0
var page3 = 0
var page4 = 0
var page5 = 0
var page6 = 0
var page7 = 0
var page8 = 0
var page9 = 0

var finished = false

var Teil1 = true
var Teil2 = false
var Teil3 = false
var Teil4 = false
var Teil5 = false
var Teil6 = false
var Teil7 = false
var Teil8 = false
var Teil9 = false

onready var Or1L = get_node("../BackgroundLeft/Ordner/Ordner_Links_2/Ordner")
onready var Or1R = get_node("../BackgroundRight/Ordner/Ordner_Rechts_2/Ordner")
onready var Or2L = get_node("../BackgroundLeft/Ordner/Ordner_Links_1/Ordner")
onready var Or2R = get_node("../BackgroundRight/Ordner/Ordner_Rechts_1/Ordner")
onready var OrRotL = get_node("../BackgroundLeft/Ordner_Links_Rot/Ordner")
onready var OrRotR = get_node("../BackgroundRight/Ordner_Rechts_Rot/Ordner")

onready var IFR = get_node("../BackgroundRight/Ordner_Rechts_Rot/Tab")
onready var IFL = get_node("../BackgroundLeft/Ordner_Links_Rot/Tab")
onready var main = get_node("../")


#onready var area = get_node("../Area2D")
#onready var or_area = get_node("../Tut_Ordner_Box")

# Called when the node enters the scene tree for the first time.
func _ready():
	load_dialog1()
	
#Mit ESC Tutorial überspringen
func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		Teil1 = false
		Teil2 = false
		Teil3 = false
		Teil4 = false
		Teil5 = false
		Teil6 = true
		
		page6 = 6
		
		Or1L.visible = true
		Or1R.visible = true
		OrRotL.visible = true
		OrRotR.visible = true
		
		load_dialog6()
		
	
func _process(_delta):
	$DialogPfeil2.visible = finished
	$DialogPfeil.visible = finished

func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Textblub.stop()

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
		elif Teil7 == true:
			load_dialog7()
		elif Teil8 == true:
			load_dialog8()
		elif Teil9 == true:
			load_dialog9()
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
		elif Teil7 == true:
			load_dialog7()
		elif Teil8 == true:
			load_dialog8()
		elif Teil9 == true:
			load_dialog9()
		
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

func next_dialog6():
	
	Teil8 = false
	Teil9 = false
	Teil7 = true
	page7 = 0
	self.visible=true
	load_dialog7()

func next_dialog7():
	Teil7 = false
	Teil9 = false
	Teil8 = true
	page8 = 0
	self.visible=true
	load_dialog8()

func next_dialog8():
	Teil8 = false
	Teil7 = false
	Teil9 = true
	page9 = 0
	self.visible=true
	load_dialog9()
	
func load_dialog1():
	if page1 < dialog1.size():
		if $RichTextLabel.percent_visible == 1:
			finished = false
			$Textblub.play()
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
			$Textblub.play()
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
			$Textblub.play()
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
			$Textblub.play()
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
			$Textblub.play()
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
			$Textblub.play()
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
		Teil6 = false

func load_dialog7():
	if page7 < dialog7.size():
		if $RichTextLabel.percent_visible == 1:
			finished = false
			$Textblub.play()
			$RichTextLabel.bbcode_text = dialog7[page7]
			$RichTextLabel2.bbcode_text = dialog7[page7]
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
			page7 += 1
			
	elif $RichTextLabel.percent_visible == 1 and page7 >= dialog7.size():
		self.visible = false
		Teil7 = false

func load_dialog8():
	if page8 < dialog8.size():
		if $RichTextLabel.percent_visible == 1:
			finished = false
			$Textblub.play()
			$RichTextLabel.bbcode_text = dialog8[page8]
			$RichTextLabel2.bbcode_text = dialog8[page8]
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
			page8 += 1
			
	elif $RichTextLabel.percent_visible == 1 and page8 >= dialog8.size():
		self.visible = false
		Teil8 = false

func load_dialog9():
	if page9 < dialog9.size():
		if $RichTextLabel.percent_visible == 1:
			finished = false
			$Textblub.play()
			$RichTextLabel.bbcode_text = dialog9[page9]
			$RichTextLabel2.bbcode_text = dialog9[page9]
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
			page9 += 1
			
	elif $RichTextLabel.percent_visible == 1 and page9 >= dialog9.size():
		self.visible = false
		Teil9 = false

