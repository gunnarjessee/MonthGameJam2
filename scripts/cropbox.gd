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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

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
			if event.is_pressed():
				create_ui()

# Creates a UI above the the crop in context
func create_ui():
	var instance = UI_SELECTOR.instance()
	if (instance == null):
		printerr('could not create UI')
	
	add_child(instance)
