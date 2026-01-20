extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_start_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://optionsMenu.tscn")


func _on_quit_pressed():
	get_tree().quit()
