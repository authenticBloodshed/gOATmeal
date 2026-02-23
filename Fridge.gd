extends Node2D
var hasItem1 = false
var hasItem2 = false
var hasItem3 = false
var hasItem4 = false
var hasItem5 = false
var hasItem6 = false
var hasItem7 = false
var hasItem8 = false

func _on_item_1_pressed():
	hasItem1 == true
	$Items/Item1.hide()
	
func _on_item_2_pressed():
	hasItem2 == true
	$Items/Item2.hide()

func _on_item_3_pressed():
	hasItem3 == true
	$Items/Item3.hide()

func _on_item_4_pressed():
	hasItem4 == true
	$Items/Item4.hide()

func _on_item_5_pressed():
	hasItem5 == true
	$Items/Item5.hide()

func _on_item_6_pressed():
	hasItem6 == true
	$Items/Item6.hide()

func _on_item_7_pressed():
	hasItem7 == true
	$Items/Item7.hide()

func _on_item_8_pressed():
	hasItem8 == true
	$Items/Item8.hide()

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		$ClickSound.play()
