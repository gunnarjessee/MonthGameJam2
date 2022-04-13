extends Node

# keeps inventory of items

var cropboxAmount: int = 1

var canPlace: bool = true

onready var CROP_BOX = load('res://scenes/cropbox.tscn')

func placeCropBox(pos: Vector2):
	var instance = CROP_BOX.instance()
	instance.position = pos
	get_tree().get_root().add_child(instance)

func _process(delta):
	if Input.action_press("disable_place") and canPlace:
		canPlace = false
		
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			placeCropBox(event.position)
