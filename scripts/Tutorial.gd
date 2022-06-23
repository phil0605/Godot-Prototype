extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time
var insta_password = "17051997"
var solved = false
var tutend = false

# Called when the node enters the scene tree for the first time.
#func _ready():
func _ready():
	$"BGM Tutorial".play()

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
			#var left = $BackgroundLeft.get_children()
			#for o in left:
			#	o.visible = false
			#var right = $BackgroundRight.get_children()
			#for o in right:
			#	o.visible = false
			#$GUI/Levelende.show_end(time)
		
		if (minutes >= 20):
			solved = true
			$GUI/Levelende.show_end(time)
	

func getPassword():
	return insta_password
	
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
