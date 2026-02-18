extends Area2D

var isDragging := false
var isPouring := false
var dragOffset := Vector2.ZERO

func _ready():
	input_pickable = true

func _input_event(viewport, event, shape_idx):
	
	# Detects that the left mouse button is being clicked
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			
			# Start dragging
			if event.pressed and not isPouring:
				isDragging = true
				dragOffset = global_position - get_global_mouse_position()
			
			# Releases and places ingredient
			elif not event.pressed and isDragging:
				isDragging = false
				$SausSprite.hide()
				$SausCollision.hide()
				

func _process(delta):
	if isDragging:
		global_position = get_global_mouse_position() + dragOffset
