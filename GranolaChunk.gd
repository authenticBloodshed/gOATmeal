extends Node2D

var dragging := true

func _process(_delta):
	if dragging:
		global_position = get_global_mouse_position()

func _input(event):
	if dragging and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			dragging = false
