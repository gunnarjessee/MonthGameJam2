extends Sprite

# This script will handle the growth events of every crop

var health: int = 100
var wetness: int = 10
var stage: int = 0

var typeofplant: String = "none"

onready var timer = $Timer

# updates crop, interval in seconds
var timerIntervals: int = 2

func set_plant(type):
	typeofplant = type
	print('Type of plant has been set too ', typeofplant)

func _ready():
	timer.start(timerIntervals)
	timer.set_autostart(false)
	self.frame = 0


func _on_Timer_timeout():
	check_plant_health()
	timer.start(timerIntervals)
	
func check_plant_health():
	print(health, " checking health of plant wetness: ", wetness)
	if wetness > 4:
		if stage < 4:
			stage += 1
			self.frame = stage - 1
	else:
		health -= 50
	
	if wetness > 0:
		wetness -= 1
	
	if health <= 0:
		get_parent().select_crop(get_parent().crops.none)
		queue_free()
		
