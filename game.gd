extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/AnimationPlayer.play("fade_out")
	await get_tree().create_timer(1.0).timeout
	$ColorRect.hide()
	$Breakfast.show()
	$CloseButton.show()
	$NotesButton.show()
	$PlaceholderImage.show()

func _on_close_button_pressed():
	$Breakfast.hide()
	$CloseButton.hide()
	$PlaceholderImage.hide()

func _on_notes_button_pressed():
	$Notebook.show()
	$NotesButton.hide()
	$CloseNotes.show()

func _on_close_notes_pressed():
	$Notebook.hide()
	$CloseNotes.hide()
	$NotesButton.show()


func _on_prep_station_button_pressed():
	get_tree().change_scene_to_file("res://PrepStation.tscn")


func _on_fridge_button_pressed():
	get_tree().change_scene_to_file("res://Fridge.tscn")

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		$ClickSound.play()
