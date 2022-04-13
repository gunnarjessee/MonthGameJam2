extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_ColorRect_mouse_exited():
	destroy_self()


func _on_ColorRect_focus_exited():
	destroy_self()

func destroy_self():
	print('Getting rid of self, ui')
	queue_free()
