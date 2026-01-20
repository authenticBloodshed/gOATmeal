extends Node2D

var buttonType = null

func _ready():
	$ColorRect.show()
	$ColorRect/AnimationPlayer.play("fade_out")
	await get_tree().create_timer(1.0).timeout
	$ColorRect.hide()

func _on_start_pressed():
	buttonType = "Start"
	$ColorRect.show()
	$ColorRect/fadeTimer.start()
	$ColorRect/AnimationPlayer.play("fade_in")


func _on_options_pressed():
	buttonType = "Options"
	$ColorRect.show()
	$ColorRect/fadeTimer.start()
	$ColorRect/AnimationPlayer.play("fade_in")

func _on_quit_pressed():
	get_tree().quit()


func _on_fade_timer_timeout():
	if buttonType == "Start" :
		get_tree().change_scene_to_file("res://game.tscn")
		
	elif buttonType == "Options" :
		get_tree().change_scene_to_file("res://optionsMenu.tscn")
