extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/TypeOptionButton.add_item("yogurt")
	$VBoxContainer/TypeOptionButton.add_item("oatmeal")
	$VBoxContainer/TypeOptionButton.add_item("other")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
