extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time

# Called when the node enters the scene tree for the first time.
func _ready():
	time = 0
	$ScoreTimer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time = time + delta
	
	var seconds:float = fmod(time , 60.0)
	var minutes:int   = int(time / 60.0) % 60
	
	$TimeLabelLeft.text = str("%02d:%02d" % [minutes, seconds])
	$TimeLabelRight.text = str("%02d:%02d" % [minutes, seconds])

	
