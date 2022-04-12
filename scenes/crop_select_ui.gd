extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Control_focus_exited():
	queue_free()


func _on_Control_mouse_exited():
	queue_free()
