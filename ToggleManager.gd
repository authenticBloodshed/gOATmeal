extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_all_button_toggled(toggled_on):
	$TabContainer/Type/YogurtButton.button_pressed = false
	$TabContainer/Type/OatmealButton.button_pressed = false
	$TabContainer/Type/OtherButton.button_pressed = false

func _on_yogurt_button_toggled(toggled_on):
	$TabContainer/Type/AllButton.button_pressed = false

func _on_oatmeal_button_toggled(toggled_on):
	$TabContainer/Type/AllButton.button_pressed = false

func _on_other_button_toggled(toggled_on):
	$TabContainer/Type/AllButton.button_pressed = false
