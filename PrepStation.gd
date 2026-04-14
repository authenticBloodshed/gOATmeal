extends Node2D

var counter = 0
var isCorrect = null
@export var saus : NodePath
@onready var apple = $DraggableObjects/Apple
@onready var granola = $DraggableObjects/GranolaBox
@onready var yogurt = $DraggableObjects/DragItem
@onready var oatmeal = $DraggableObjects/DragOatmeal
@onready var peach = $DraggableObjects/Peach
@onready var kiwi = $DraggableObjects/Kiwi
@onready var goldenKiwi = $DraggableObjects/GoldenKiwi
@onready var banana = $DraggableObjects/Banana
@onready var raspberry = $DraggableObjects/Raspberry
@onready var chia = $DraggableObjects/Chiaseeds
@onready var pistachio = $DraggableObjects/Pistachio
@onready var cranberries = $DraggableObjects/Cranberries
@onready var blackberries = $DraggableObjects/Blackberries
@onready var blueberries = $DraggableObjects/Blueberries
@onready var quinoa = $DraggableObjects/Quinoa
@onready var nibs = $DraggableObjects/Cacaonibs
@onready var cashews = $DraggableObjects/Cashews
@onready var cherries = $DraggableObjects/Cherries
@onready var flax = $DraggableObjects/Flax
@onready var grapes = $DraggableObjects/Grapes
@onready var pear = $DraggableObjects/Pear
@onready var walnut = $DraggableObjects/Walnut
@onready var rice = $DraggableObjects/Rice
@onready var pineapple = $DraggableObjects/Pineapple
@onready var pecans = $DraggableObjects/Pecans
@onready var redGrape = $DraggableObjects/RedGrape
@onready var dates = $DraggableObjects/Dates
@onready var hazelnut = $DraggableObjects/Hazelnut
@onready var sunflower = $DraggableObjects/Sunflower
@onready var strawberries = $DraggableObjects/Strawberries
@onready var cinnamon = $DraggableObjects/Cinnamon
@onready var cocoa = $DraggableObjects/Cocoa
@onready var coconut = $DraggableObjects/Coconutflakes
@onready var macadamia = $DraggableObjects/Macadamia
@onready var raisin = $DraggableObjects/Raisin
@onready var jam = $DraggableObjects/Jam
@onready var goji = $DraggableObjects/Goji
@onready var almonds = $DraggableObjects/Almonds
@onready var sauce = $DraggableObjects/Saus

func _process(delta):
	if GameManager.is_item_collected("chia"):
		$DraggableObjects/Chiaseeds.show()
		
	if GameManager.is_item_collected("strawberries"):
		$DraggableObjects/Strawberries.show()
	
	if GameManager.is_item_collected("blueberries"):
		$DraggableObjects/Blueberries.show()
	
	if GameManager.is_item_collected("yogurt"):
		$DraggableObjects/DragItem.show()

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		$DraggableObjects/ClickSound.play()

func _on_next_bowl_button_pressed():
	counter += 1
	update_bowl()

func _on_previous_bowl_button_pressed():
	counter -= 1
	update_bowl()

func update_bowl():
	if counter == 0:
		$FinalAssets/Bowl1.show()
		$inalAssets/HeartBowl.hide()
		$inalAssets/CheckerBowl.hide()
	
	if counter == 1:
		$FinalAssets/HeartBowl.show()
		$FinalAssets/Bowl1.hide()
		$FinalAssets/CheckerBowl.hide()
	
	if counter == 2:
		$FinalAssets/HeartBowl.hide()
		$FinalAssets/Bowl1.hide()
		$FinalAssets/CheckerBowl.show()
		
	if counter >= 3:
		$FinalAssets/CheckerBowl.hide()
		$FinalAssets/HeartBowl.hide()
		$FinalAssets/Bowl1.show()
		counter = 0
	
	if counter < 0:
		$FinalAssets/CheckerBowl.show()
		$FinalAssets/HeartBowl.hide()
		$FinalAssets/Bowl1.hide()
		counter = 2

func _on_area_2d_body_entered(body):
	$DraggableObjects/Saus/CPUParticles2D.show()
	
	print("hoi")
		

func _on_retry_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")

func _on_replay_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_recipebook_button_pressed():
	get_tree().change_scene_to_file("res://recipebook.tscn")

func _on_button_pressed():
	isCorrect = true 
	
	if isCorrect == false:
		$"../LoseScreen".show()
		$"../Button".hide()
		
	if isCorrect == true:
		$"../WinScreen".show()
		$"../Button".hide()

func _check_inventory():
	if GameManager.is_item_collected("chia"):
		chia.show()
		
	if GameManager.is_item_collected("strawberry"):
		$DraggableObjects/Strawberries.show()
	
	if GameManager.is_item_collected("blueberries"):
		$DraggableObjects/Blueberries.show()
