extends Control
# the parent of this node is cropbox

var parent = null

func _ready():
	parent = get_parent()

func _on_ColorRect_mouse_exited():
	destroy_self()


func _on_ColorRect_focus_exited():
	destroy_self()

func destroy_self():
	print('Getting rid of self, ui')
	GameHandler.toggleInterfacing()
	queue_free()


func _on_wheat_button_button_down():
	parent.select_crop(parent.crops.wheat)
	destroy_self()


func _on_grape_button_button_down():
	parent.select_crop(parent.crops.grapes)
	destroy_self()
