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
	if Input.get_action_strength("disable_place") > 0:
		canPlace = false
		print('disabling place')
