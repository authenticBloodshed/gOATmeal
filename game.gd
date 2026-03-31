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
	$KitchenStuff/Banana/CollisionShape2D.disabled = true
	$KitchenStuff/Apple/CollisionShape2D.disabled = true
	$KitchenStuff/Pear/CollisionShape2D.disabled = true
	$KitchenStuff/Chiaseeds/CollisionShape2D.disabled = true
	$KitchenStuff/Granola/CollisionShape2D.disabled = true
	$KitchenStuff/Oats/CollisionShape2D.disabled = true
	$KitchenStuff/SunflowerSeeds/CollisionShape2D.disabled = true
	$KitchenStuff/CoconutFlakes/CollisionShape2D.disabled = true
	$KitchenStuff/CacaoNibs/CollisionShape2D.disabled = true
	$KitchenStuff/puffedrice/CollisionShape2D.disabled = true
	$KitchenStuff/cocao/CollisionShape2D.disabled = true
	$KitchenStuff/puffedquinoa/CollisionShape2D.disabled = true
	$KitchenStuff/biscuits/CollisionShape2D.disabled = true
	$KitchenStuff/FlaxSeeds/CollisionShape2D.disabled = true
	$KitchenStuff/Raisins/CollisionShape2D.disabled = true
	$KitchenStuff/StrawberrySauce/CollisionShape2D.disabled = true
	$KitchenStuff/ChocolateSauce/CollisionShape2D.disabled = true
	$KitchenStuff/CaramelSauce/CollisionShape2D.disabled = true
	$KitchenStuff/PeanutButter/CollisionShape2D.disabled = true
	$KitchenStuff/CRanberries/CollisionShape2D.disabled = true
	$KitchenStuff/Gojiberries/CollisionShape2D.disabled = true
	$KitchenStuff/Pineapple/CollisionShape2D.disabled = true
	$KitchenStuff/Cinnamon/CollisionShape2D.disabled = true
	$KitchenStuff/Sprinkles/CollisionShape2D.disabled = true
	$KitchenStuff/jam/CollisionShape2D.disabled = true
	$KitchenStuff/honey/CollisionShape2D.disabled = true
	$KitchenStuff/Almonds/CollisionShape2D.disabled = true
	$KitchenStuff/Walnuts/CollisionShape2D.disabled = true
	$KitchenStuff/Pecans/CollisionShape2D.disabled = true
	$KitchenStuff/Hazelnut/CollisionShape2D.disabled = true
	$KitchenStuff/Cashews/CollisionShape2D.disabled = true
	$KitchenStuff/Pistachios/CollisionShape2D.disabled = true
	$KitchenStuff/Macadamia/CollisionShape2D.disabled = true
	$FridgeButton.mouse_filter = Control.MOUSE_FILTER_IGNORE

func _on_fridge_button_pressed():
	$Fridge.show()
	$KitchenStuff/Banana/CollisionShape2D.disabled = true
	$KitchenStuff/Apple/CollisionShape2D.disabled = true
	$KitchenStuff/Pear/CollisionShape2D.disabled = true
	$KitchenStuff/Chiaseeds/CollisionShape2D.disabled = true
	$KitchenStuff/Granola/CollisionShape2D.disabled = true
	$KitchenStuff/Oats/CollisionShape2D.disabled = true
	$KitchenStuff/SunflowerSeeds/CollisionShape2D.disabled = true
	$KitchenStuff/CoconutFlakes/CollisionShape2D.disabled = true
	$KitchenStuff/CacaoNibs/CollisionShape2D.disabled = true
	$KitchenStuff/puffedrice/CollisionShape2D.disabled = true
	$KitchenStuff/cocao/CollisionShape2D.disabled = true
	$KitchenStuff/puffedquinoa/CollisionShape2D.disabled = true
	$KitchenStuff/biscuits/CollisionShape2D.disabled = true
	$KitchenStuff/FlaxSeeds/CollisionShape2D.disabled = true
	$KitchenStuff/Raisins/CollisionShape2D.disabled = true
	$KitchenStuff/StrawberrySauce/CollisionShape2D.disabled = true
	$KitchenStuff/ChocolateSauce/CollisionShape2D.disabled = true
	$KitchenStuff/CaramelSauce/CollisionShape2D.disabled = true
	$KitchenStuff/PeanutButter/CollisionShape2D.disabled = true
	$KitchenStuff/CRanberries/CollisionShape2D.disabled = true
	$KitchenStuff/Gojiberries/CollisionShape2D.disabled = true
	$KitchenStuff/Pineapple/CollisionShape2D.disabled = true
	$KitchenStuff/Cinnamon/CollisionShape2D.disabled = true
	$KitchenStuff/Sprinkles/CollisionShape2D.disabled = true
	$KitchenStuff/jam/CollisionShape2D.disabled = true
	$KitchenStuff/honey/CollisionShape2D.disabled = true
	$KitchenStuff/Almonds/CollisionShape2D.disabled = true
	$KitchenStuff/Walnuts/CollisionShape2D.disabled = true
	$KitchenStuff/Pecans/CollisionShape2D.disabled = true
	$KitchenStuff/Hazelnut/CollisionShape2D.disabled = true
	$KitchenStuff/Cashews/CollisionShape2D.disabled = true
	$KitchenStuff/Pistachios/CollisionShape2D.disabled = true
	$KitchenStuff/Macadamia/CollisionShape2D.disabled = true
	$PantryButton.show()

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		$ClickSound.play()

func _on_kitchen_button_pressed():
	$PrepStation.hide()
	$KitchenButton.hide()
	$FridgeButton.show()
	$FridgeButton.disabled = false
	$KitchenStuff/Banana/CollisionShape2D.disabled = false
	$KitchenStuff/Apple/CollisionShape2D.disabled = false
	$KitchenStuff/Pear/CollisionShape2D.disabled = false
	$KitchenStuff/Chiaseeds/CollisionShape2D.disabled = false
	$KitchenStuff/Granola/CollisionShape2D.disabled = false
	$KitchenStuff/Oats/CollisionShape2D.disabled = false
	$KitchenStuff/SunflowerSeeds/CollisionShape2D.disabled = false
	$KitchenStuff/CoconutFlakes/CollisionShape2D.disabled = false
	$KitchenStuff/CacaoNibs/CollisionShape2D.disabled = false
	$KitchenStuff/puffedrice/CollisionShape2D.disabled = false
	$KitchenStuff/cocao/CollisionShape2D.disabled = false
	$KitchenStuff/puffedquinoa/CollisionShape2D.disabled = false
	$KitchenStuff/biscuits/CollisionShape2D.disabled = false
	$KitchenStuff/FlaxSeeds/CollisionShape2D.disabled = false
	$KitchenStuff/Raisins/CollisionShape2D.disabled = false
	$KitchenStuff/StrawberrySauce/CollisionShape2D.disabled = false
	$KitchenStuff/ChocolateSauce/CollisionShape2D.disabled = false
	$KitchenStuff/CaramelSauce/CollisionShape2D.disabled = false
	$KitchenStuff/PeanutButter/CollisionShape2D.disabled = false
	$KitchenStuff/CRanberries/CollisionShape2D.disabled = false
	$KitchenStuff/Gojiberries/CollisionShape2D.disabled = false
	$KitchenStuff/Pineapple/CollisionShape2D.disabled = false
	$KitchenStuff/Cinnamon/CollisionShape2D.disabled = false
	$KitchenStuff/Sprinkles/CollisionShape2D.disabled = false
	$KitchenStuff/jam/CollisionShape2D.disabled = false
	$KitchenStuff/honey/CollisionShape2D.disabled = false
	$KitchenStuff/Almonds/CollisionShape2D.disabled = false
	$KitchenStuff/Walnuts/CollisionShape2D.disabled = false
	$KitchenStuff/Pecans/CollisionShape2D.disabled = false
	$KitchenStuff/Hazelnut/CollisionShape2D.disabled = false
	$KitchenStuff/Cashews/CollisionShape2D.disabled = false
	$KitchenStuff/Pistachios/CollisionShape2D.disabled = false
	$KitchenStuff/Macadamia/CollisionShape2D.disabled = false
	$FridgeButton.mouse_filter = Control.MOUSE_FILTER_STOP
	
func _on_pantry_button_pressed():
	$PantryButton.hide()
	$Fridge.hide()
	$KitchenStuff/Banana/CollisionShape2D.disabled = false
	$KitchenStuff/Apple/CollisionShape2D.disabled = false
	$KitchenStuff/Pear/CollisionShape2D.disabled = false
	$KitchenStuff/Chiaseeds/CollisionShape2D.disabled = false
	$KitchenStuff/Granola/CollisionShape2D.disabled = false
	$KitchenStuff/Oats/CollisionShape2D.disabled = false
	$KitchenStuff/SunflowerSeeds/CollisionShape2D.disabled = false
	$KitchenStuff/CoconutFlakes/CollisionShape2D.disabled = false
	$KitchenStuff/CacaoNibs/CollisionShape2D.disabled = false
	$KitchenStuff/puffedrice/CollisionShape2D.disabled = false
	$KitchenStuff/cocao/CollisionShape2D.disabled = false
	$KitchenStuff/puffedquinoa/CollisionShape2D.disabled = false
	$KitchenStuff/biscuits/CollisionShape2D.disabled = false
	$KitchenStuff/FlaxSeeds/CollisionShape2D.disabled = false
	$KitchenStuff/Raisins/CollisionShape2D.disabled = false
	$KitchenStuff/StrawberrySauce/CollisionShape2D.disabled = false
	$KitchenStuff/ChocolateSauce/CollisionShape2D.disabled = false
	$KitchenStuff/CaramelSauce/CollisionShape2D.disabled = false
	$KitchenStuff/PeanutButter/CollisionShape2D.disabled = false
	$KitchenStuff/CRanberries/CollisionShape2D.disabled = false
	$KitchenStuff/Gojiberries/CollisionShape2D.disabled = false
	$KitchenStuff/Pineapple/CollisionShape2D.disabled = false
	$KitchenStuff/Cinnamon/CollisionShape2D.disabled = false
	$KitchenStuff/Sprinkles/CollisionShape2D.disabled = false
	$KitchenStuff/jam/CollisionShape2D.disabled = false
	$KitchenStuff/honey/CollisionShape2D.disabled = false
	$KitchenStuff/Almonds/CollisionShape2D.disabled = false
	$KitchenStuff/Walnuts/CollisionShape2D.disabled = false
	$KitchenStuff/Pecans/CollisionShape2D.disabled = false
	$KitchenStuff/Hazelnut/CollisionShape2D.disabled = false
	$KitchenStuff/Cashews/CollisionShape2D.disabled = false
	$KitchenStuff/Pistachios/CollisionShape2D.disabled = false
	$KitchenStuff/Macadamia/CollisionShape2D.disabled = false
