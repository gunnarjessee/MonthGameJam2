extends Sprite

onready var UI_SELECTOR = load('res://scenes/crop_select.tscn')

enum crops {
	wheat,
	
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			create_ui()

# Creates a UI above the the crop in context
func create_ui():
	var instance = UI_SELECTOR.instance()
	add_child(instance)
