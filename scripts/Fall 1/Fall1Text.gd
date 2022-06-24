extends Control

#Einführung
var dialog1 = ["Willkommen zurück!", 
			   "Du weißt, was zu tun ist.", 
			   "Du hast 15 Minuten Zeit. Los gehts!"]
var dialog2 = ["Schade, das war leider falsch! Aber kein Problem, wir haben noch 3 Versuche.",
				"Gebt jetzt nicht auf und macht weiter!"]
				
var dialog3 = ["Mist, schon wieder nicht richtig! Jetzt sind noch 2 Versuche übrig.",
				"Ich glaube ich habe eine Idee, beim nächsten Mal gebe ich euch ein Tipp!"]
				
var dialog4 = ["Okay das ist jetzt unser letzer Versuch, bevor wir 60 Sekunden verlieren.",
				"Ich glaube wir sollten eines dieser häufigen Passwörter aus dem Nachrichtenartikel versuchen!",
				"Lasst jetzt bloß nicht den Kopf hängen!"]
				
var dialog5 = ["Okay das ist jetzt unser letzer Versuch, bevor wir 60 Sekunden verlieren.",
				"Ich glaube wir sollten nach einer Zahl suchen und sie mithilfe der Cäsar-Verschlüsselung entschlüsseln.",
				 "Der Key, also der Schlüssel, muss hier auch irgendwo stehen.",
				"Lasst jetzt bloß nicht den Kopf hängen!"]
				
var dialog_gelb_end = ["Sehr gut! Hätte er mal ein individuelles Passwort genommen. Aber so macht es das für uns leichter."]
var dialog_end  = ["Gut gemacht!", 
					"Schon merkwürdig, dass das Ergebnis der Cäsar-Verschlüsselung wieder sein Geburtstag ist!",
					"Aber egal. Hier ist eure Belohnung!"]
				


var page1 = 0
var page2 = 0
var page3 = 0
var page4 = 0
var page5 = 0
var page_gelb_end = 0
var page_end = 0

var finished = false

var Teil1 = true
var Teil2 = false
var Teil3 = false
var Teil4 = false
var Teil5 = false
var Teil_gelb_end = false
var Teil_end = false

onready var main = get_node("../")
onready var Score = get_node ("../")

onready var Or1L = get_node("../BackgroundLeft/Ordner/Ordner_Links_2/Ordner")
onready var Or1R = get_node("../BackgroundRight/Ordner/Ordner_Rechts_2/Ordner")
onready var Or2L = get_node("../BackgroundLeft/Ordner/Ordner_Links_1/Ordner")
onready var Or2R = get_node("../BackgroundRight/Ordner/Ordner_Rechts_1/Ordner")
onready var OrGelbL = get_node("../BackgroundLeft/Ordner_Links_Gelb/Ordner")
onready var OrGelbR = get_node("../BackgroundRight/Ordner_Rechts_Gelb/Ordner")

onready var IGR = get_node("../BackgroundRight/Ordner_Rechts_Gelb/Tab")
onready var IGL = get_node("../BackgroundLeft/Ordner_Links_Gelb/Tab")

onready var IRR = get_node("../BackgroundRight/Ordner_Rechts_Rot/Tab")
onready var IRL = get_node("../BackgroundLeft/Ordner_Links_Rot/Tab")

# Called when the node enters the scene tree for the first time.
func _ready():
	load_dialog1()
	
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
		elif Teil_gelb_end == true:
			load_dialog_gelb_end()
		elif Teil_end== true:
			load_dialog_end()
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
		elif Teil_gelb_end == true:
			load_dialog_gelb_end()
		elif Teil_end== true:
			load_dialog_end()
			

func next_dialog2():
	
	Teil3 = false
	Teil4 = false
	Teil2 = true
	page2 = 0
	self.visible=true
	load_dialog2()

func next_dialog3():
	Teil2 = false
	Teil4 = false
	Teil3 = true
	page3 = 0
	self.visible=true
	load_dialog3()

func next_dialog4():
	Teil3 = false
	Teil2 = false
	Teil4 = true
	page4 = 0
	self.visible=true
	load_dialog4()
	
func next_dialog5():
	Teil3 = false
	Teil2 = false
	Teil5 = true
	self.visible = true
	load_dialog5()

func next_dialog_gelb_end():
	Teil_gelb_end = true
	self.visible = true
	load_dialog_gelb_end()
	
func next_dialog_end():
	Teil_end = true
	self.visible = true
	load_dialog_end()
	
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
			
	elif $RichTextLabel.percent_visible == 1 and page1 >= dialog1.size():
		Or1L.visible = true
		Or2L.visible = true
		OrGelbL.visible = true
		Or1R.visible = true
		Or2R.visible = true
		OrGelbR.visible = true
		IGR.tutorial_end()
		IGL.tutorial_end()
		main.start_now()
		main.tutorial_end()
		self.visible = false
		Teil1 = false

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
			
	elif $RichTextLabel.percent_visible == 1 and page2 >= dialog2.size():
		self.visible = false
		Teil2 = false

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
			
	elif $RichTextLabel.percent_visible == 1 and page3 >= dialog3.size():
		self.visible = false
		Teil3 = false

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
			
	elif $RichTextLabel.percent_visible == 1 and page4 >= dialog4.size():
		self.visible = false
		Teil4 = false
		
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
			
	elif $RichTextLabel.percent_visible == 1 and page5 >= dialog5.size():
		self.visible = false
		Teil4 = false
		
func load_dialog_gelb_end():
	if page_gelb_end < dialog_gelb_end.size():
		if $RichTextLabel.percent_visible == 1:
			finished = false
			$Textblub.play()
			$RichTextLabel.bbcode_text = dialog_gelb_end[page_gelb_end]
			$RichTextLabel2.bbcode_text = dialog_gelb_end[page_gelb_end]
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
			page_gelb_end += 1
			
	elif $RichTextLabel.percent_visible == 1 and page_gelb_end >= dialog_gelb_end.size():
		IRL.tutorial_end()
		IRR.tutorial_end()
		self.visible = false
		Teil_gelb_end = false

func load_dialog_end():
	if page_end < dialog_end.size():
		if $RichTextLabel.percent_visible == 1:
			finished = false
			$Textblub.play()
			$RichTextLabel.bbcode_text = dialog_end[page_end]
			$RichTextLabel2.bbcode_text = dialog_end[page_end]
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
			page_end += 1
			
	elif $RichTextLabel.percent_visible == 1 and page_end >= dialog_end.size():
		self.visible = false
		Teil_end = false
		Score.ScoreBoard()
