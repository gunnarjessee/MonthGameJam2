extends Node

# keeps inventory of items

var cropboxAmount: int = 1

var canPlace: bool = true

onready var CROP_BOX = load('res://scenes/cropbox.tscn')

func placeCropBox(pos: Vector2):
	var instance = CROP_BOX.instance()
	instance.position = pos
	var tempPos = instance.position
	tempPos = Vector2(round(tempPos.x / 16), round(tempPos.y / 16))
	print(tempPos)
	tempPos.x = tempPos.x * 16
	tempPos.y = tempPos.y * 16
	instance.position = tempPos
	get_tree().get_root().add_child(instance)

func _process(delta):
	if Input.action_press("disable_place") and canPlace:
		canPlace = false
		
var tempPos = null
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			if not GameHandler.isInterfacing:
				tempPos = Vector2(round(event.position.x / 16), round(event.position.y / 16))
				if GameHandler.checkTransaction(GameHandler.SHOP_BUY.cropbox):
					if GridHandler.checkOccupied(tempPos.x, tempPos.y) == false:
						GameHandler.buyItem(GameHandler.SHOP_BUY.cropbox)
						placeCropBox(event.position)
						GridHandler.occupy(tempPos.x, tempPos.y)
