extends Area2D

@export var itemId : String = "item"
var pickedUp : bool = false

func _input_event(viewport, event, shape_idx):
	if pickedUp:
		return
		
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			pickup()

func pickup():
	pickedUp = true
	
	# Tell the game an ingredient was collected
	GameManager.set_item_collected(itemId, true)
	
	# Removes the ingredient from the kitchen
	queue_free()
	
	if GameManager.is_item_collected("chia"):
		print("Picked up chiaseeds")
