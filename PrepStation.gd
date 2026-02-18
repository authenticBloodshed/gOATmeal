extends Node2D

var counter = 0
@export var saus : NodePath

func _ready():
	pass # Replace with function body.

func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

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
		$FinalAssets/HeartBowl.hide()
		$FinalAssets/CheckerBowl.hide()
	
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
		
