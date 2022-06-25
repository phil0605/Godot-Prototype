extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time
var rand_password = ["123456", "654321", "000000"]
var solved = false
var tutend = false
var password_gelb
var password_rot = "1705"
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
#func _ready():
func _ready():
	$"BGM Tutorial".play()
	rng.randomize()
	var rand = rng.randi_range(0, 2)
	password_gelb = rand_password[rand]
	print(password_gelb)

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			$Click.play()
			$TippEffekt.global_position = event.position
			$TippEffekt.emitting =  true

func start_now():
	time = 0
	$ScoreTimer.start()
	
func tutorial_end():
	tutend = !tutend
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if tutend == true:
		if (!solved):
			time = time + delta
	
		var seconds:float = fmod(time , 60.0)
		var minutes:int   = int(time / 60.0) % 60
	
		$TimeLabelLeft.text = str("%02d:%02d" % [minutes, seconds])
		$TimeLabelRight.text = str("%02d:%02d" % [minutes, seconds])
		
	
		# nach dem erfolgreichen Lösen des Falls werden alle Objekte ausgeblendet
		if(solved):
			$Right/Right_Green.play("right")
			tutorial_end()
			$Textbox.next_dialog_end()
			
		
		if (minutes >= 15):
			solved = true
			$GUI/Levelende.show_end(time)
	
func next_phase():
	$Right/Right_Green.play("right")
	$Textbox.next_dialog_gelb_end()
	$BackgroundLeft/Ordner_Links_Rot/Ordner.visible = true
	$BackgroundRight/Ordner_Rechts_Rot/Ordner.visible = true
	$BackgroundLeft/Ordner/Ordner_Links_3/Ordner.visible = true
	$BackgroundLeft/Ordner/Ordner_Links_4/Ordner.visible = true
	$BackgroundRight/Ordner/Ordner_Rechts_3/Ordner.visible = true
	$BackgroundRight/Ordner/Ordner_Rechts_4/Ordner.visible = true

func getPassword_gelb():
	return password_gelb

func getPassword_rot():
	return password_rot
	
func setTime(new_time):
	time = new_time

func getTime():
	return time

func stopTime():
	solved = true


func _on_Test_pressed():
	tutorial_end()

func ScoreBoard():
			
			var left = $BackgroundLeft.get_children()
			for o in left:
				o.visible = false
			var right = $BackgroundRight.get_children()
			for o in right:
				o.visible = false
			$GUI/Levelende.show_end(time)
