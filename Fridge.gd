extends Node2D
var hasItem1 = false
var hasItem2 = false
var hasItem3 = false
var hasItem4 = false
var hasItem5 = false
var hasItem6 = false
var hasItem7 = false
var hasItem8 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_pantry_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_item_1_pressed():
	hasItem1 == true
	$Item1.hide()
	
func _on_item_2_pressed():
	hasItem2 == true
	$Item2.hide()

func _on_item_3_pressed():
	hasItem3 == true
	$Item3.hide()

func _on_item_4_pressed():
	hasItem4 == true
	$Item4.hide()

func _on_item_5_pressed():
	hasItem5 == true
	$Item5.hide()

func _on_item_6_pressed():
	hasItem6 == true
	$Item6.hide()

func _on_item_7_pressed():
	hasItem7 == true
	$Item7.hide()

func _on_item_8_pressed():
	hasItem8 == true
	$Item8.hide()
