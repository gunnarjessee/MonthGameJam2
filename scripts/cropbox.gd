extends Sprite

onready var UI_SELECTOR = load('res://scenes/crop_select.tscn')
onready var WHEAT_PLANT = load('res://scenes/wheatcrop.tscn')
onready var GRAPE_PLANT = load('res://scenes/grapecrop.tscn')

enum crops {
	wheat,
	grapes,
	none
}

var selected_crop = crops.none;

func _ready():
	var tempPos = self.position
	tempPos = Vector2(round(tempPos.x / 16), round(tempPos.y / 16))
	tempPos.x = tempPos.x * 16
	tempPos.y = tempPos.y * 16
	self.position = tempPos
	

func select_crop(crop):
	selected_crop = crop
	print('Crop has been selected')
	match crop:
		crops.wheat:
			print('instantiating a wheat plant')
			var instance = WHEAT_PLANT.instance()
			add_child(instance)
			
		crops.grapes:
			print('instantiating a grape plant')
			var instance = GRAPE_PLANT.instance()
			add_child(instance)
			

func _on_Area2D_input_event(viewport, event, shape_idx):
	if selected_crop == crops.none:
		if event is InputEventMouseButton:
			if event.is_pressed() and event.button_index == BUTTON_RIGHT:
				create_ui()

# Creates a UI above the the crop in context
func create_ui():
	if not GameHandler.isInterfacing:
		var instance = UI_SELECTOR.instance()
		if (instance == null):
			printerr('could not create UI')
		add_child(instance)
		GameHandler.toggleInterfacing()
