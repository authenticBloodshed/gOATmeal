extends Area2D

@export var itemId : String = "item"
@export var itemName: String = "Item"
@export var itemDescription: String = "Description"

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

func _mouse_exited():
	var tooltip = get_tree().get_first_node_in_group("tooltip")
	if tooltip:
		tooltip.hide_tooltip()
		

func _on_mouse_entered():
	var tooltip = get_tree().get_first_node_in_group("tooltip")
	if tooltip:
		tooltip.show_tooltip(itemName, itemDescription)

func _on_mouse_exited():
	var tooltip = get_tree().get_first_node_in_group("tooltip")
	if tooltip:
		tooltip.hide_tooltip()
