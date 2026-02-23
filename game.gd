extends Node2D

func _ready():
	$ColorRect/AnimationPlayer.play("fade_out")
	await get_tree().create_timer(1.0).timeout
	$ColorRect.hide()
	$Breakfast.show()
	$CloseButton.show()
	$Finalbreakfast.show()

func _on_close_button_pressed():
	$Breakfast.hide()
	$CloseButton.hide()
	$Finalbreakfast.hide()
	$NotebookManager.show()

func _on_prep_station_button_pressed():
	$PrepStation.show()
	$KitchenButton.show()
	$FridgeButton.hide()
	$FridgeButton.disabled = true
	$FridgeButton.mouse_filter = Control.MOUSE_FILTER_IGNORE

func _on_fridge_button_pressed():
	$Fridge.show()
	$PantryButton.show()

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		$ClickSound.play()

func _on_kitchen_button_pressed():
	$PrepStation.hide()
	$KitchenButton.hide()
	$FridgeButton.show()
	$FridgeButton.disabled = false
	$FridgeButton.mouse_filter = Control.MOUSE_FILTER_STOP
	
func _on_pantry_button_pressed():
	$PantryButton.hide()
	$Fridge.hide()
