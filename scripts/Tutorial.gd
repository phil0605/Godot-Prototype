extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time
var insta_password = "17051997"
var congrat_message = ""
var solved = false

# Called when the node enters the scene tree for the first time.
func _ready():
	time = 0
	$ScoreTimer.start()
	$CongratulationLabelLeft.visible = false
	$CongratulationLabelRight.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!solved):
		time = time + delta
	
	var seconds:float = fmod(time , 60.0)
	var minutes:int   = int(time / 60.0) % 60
	
	$TimeLabelLeft.text = str("%02d:%02d" % [minutes, seconds])
	$TimeLabelRight.text = str("%02d:%02d" % [minutes, seconds])
	
	$CongratulationLabelLeft.text = congrat_message
	$CongratulationLabelRight.text = congrat_message
	
	

func getPassword():
	return insta_password
	
func setTime(new_time):
	time = new_time

func getTime():
	return time

func stopTime():
	solved = true
	
func setCongratMessage(new_congrat_message):
	congrat_message = new_congrat_message
	$CongratulationLabelLeft.show()
	$CongratulationLabelRight.show()
