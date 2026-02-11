extends Area2D

@export var targetPath : NodePath   # Assigns what to activate on drop

var dragging := false

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			dragging = true
			z_index = 10  # Bring forward

func _process(delta):
	if dragging:
		global_position = get_global_mouse_position()

func _input(event):
	if dragging and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			finish_drag()

func finish_drag():
	dragging = false
	z_index = 0
	
	# Activates target
	var target = get_node(targetPath)
	target.visible = true
	
	# Removes the oatmeal from scene
	queue_free()
