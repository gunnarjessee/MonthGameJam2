extends Sprite

onready var UI_SELECTOR = load('res://scenes/crop_select.tscn')
onready var WHEAT_PLANT = load('res://scenes/wheatcrop.tscn')
onready var GRAPE_PLANT = load('res://scenes/grapecrop.tscn')

onready var dyingParticles = $DyingPart

enum crops {
	wheat,
	grapes,
	none
}

var gridPos: Vector2 = Vector2()
var selected_crop = crops.none;

func _ready():
	gridPos = Vector2(round(position.x / 16), round(position.y / 16))
	dyingParticles.emitting = false
	
func select_crop(crop):
	selected_crop = crop
	print('Crop has been selected')
	match crop:
		crops.wheat:
			if GameHandler.checkTransaction(GameHandler.SHOP_BUY.wheat):
				print('instantiating a wheat plant')
				var instance = WHEAT_PLANT.instance()
				GameHandler.buyItem(GameHandler.SHOP_BUY.wheat)
				add_child(instance)
			else:
				print('Unable to purchase')
				
		crops.grapes:
			if GameHandler.checkTransaction(GameHandler.SHOP_BUY.grapes):
				print('instantiating a plant plant')
				var instance = GRAPE_PLANT.instance()
				GameHandler.buyItem(GameHandler.SHOP_BUY.grapes)
				add_child(instance)
			else:
				print('Unable to purchase')
				
			

func _on_Area2D_input_event(viewport, event, shape_idx):
	if selected_crop == crops.none:
		if event is InputEventMouseButton:
			if event.is_pressed() and event.button_index == BUTTON_RIGHT:
				create_ui()
			if event.is_pressed() and event.button_index == BUTTON_MIDDLE:
				GameHandler.sellItem(GameHandler.SHOP_SELL.cropbox)
				queue_free()
				GridHandler.empty(gridPos.x, gridPos.y)
				
# Creates a UI above the the crop in context
func create_ui():
	if not GameHandler.isInterfacing:
		var instance = UI_SELECTOR.instance()
		if (instance == null):
			printerr('could not create UI')
		add_child(instance)
		GameHandler.toggleInterfacing()
		
func startDyingParticles():
	dyingParticles.emitting = true
	
func stopDyingParticles():
	dyingParticles.emitting = false
	
