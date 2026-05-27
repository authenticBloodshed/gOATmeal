extends Control
var selectedImagePath = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/TypeOptionButton.add_item("yogurt")
	$VBoxContainer/TypeOptionButton.add_item("oatmeal")
	$VBoxContainer/TypeOptionButton.add_item("other")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_upload_image_button_pressed():
	$ImageFileDialog.popup_centered()


func _on_image_file_dialog_file_selected(path):
	selectedImagePath = path

	var image = Image.new()
	image.load(path)

	var texture = ImageTexture.create_from_image(image)

	$ImageLabel/RecipePreview.texture = texture


func _on_save_recipe_button_pressed():
	print("Recipe saved!") #REPLACE LATER
