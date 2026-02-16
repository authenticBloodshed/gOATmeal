extends Node2D

func _ready():
	$ColorRect/AnimationPlayer.play("fade_out")
	await get_tree().create_timer(1.0).timeout
	$ColorRect.hide()
	$Breakfast.show()
	$CloseButton.show()
	$PlaceholderImage.show()

func _on_close_button_pressed():
	$Breakfast.hide()
	$CloseButton.hide()
	$PlaceholderImage.hide()
	$NotebookManager.show()

func _on_prep_station_button_pressed():
	get_tree().change_scene_to_file("res://PrepStation.tscn")


func _on_fridge_button_pressed():
	get_tree().change_scene_to_file("res://Fridge.tscn")

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		$ClickSound.play()
