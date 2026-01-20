extends Node2D

var buttonType = null

func _ready():
	$ColorRect.show()
	$ColorRect/AnimationPlayer.play("fade_out")
	await get_tree().create_timer(1.0).timeout
	$ColorRect.hide()

func _process(delta):
	pass


func _on_button_pressed():
		buttonType = "Back"
		$ColorRect.show()
		$ColorRect/fadeTimer.start()
		$ColorRect/AnimationPlayer.play("fade_in")
		await get_tree().create_timer(1.0).timeout
		$ColorRect.hide()

func _on_fade_timer_timeout():
	if buttonType == "Back" :
		get_tree().change_scene_to_file("res://MainMenu.gd")
