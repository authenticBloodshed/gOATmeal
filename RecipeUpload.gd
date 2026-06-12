extends Control
var selectedImagePath = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/TypeOptionButton.add_item("yogurt")
	$VBoxContainer/TypeOptionButton.add_item("oatmeal")
	$VBoxContainer/TypeOptionButton.add_item("other")
	$ImageFileDialog.use_native_dialog = true

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
	var savedImagePath = saveRecipeImage(selectedImagePath)

	var recipe = {
		"name": $VBoxContainer/RecipeNameEdit.text,
		"type": $VBoxContainer/TypeOptionButton.get_item_text(
			$VBoxContainer/TypeOptionButton.selected
		),
		"tags": getSelectedTags(),
		"ingredients": getSelectedIngredients(),
		"imagePath": savedImagePath
	}
	saveRecipe(recipe)

func loadRecipes():

	if not FileAccess.file_exists("user://recipes.json"):
		return []

	var file = FileAccess.open(
		"user://recipes.json",
		FileAccess.READ
	)

	var content = file.get_as_text()

	file.close()

	var json = JSON.new()
	json.parse(content)

	return json.data

func saveRecipe(recipe):

	var recipes = loadRecipes()

	recipes.append(recipe)

	var file = FileAccess.open(
		"user://recipes.json",
		FileAccess.WRITE
	)

	file.store_string(JSON.stringify(recipes))

	file.close()

func ensureImageFolder():
	var dir = DirAccess.open("user://")

	if not dir.dir_exists("recipeImages"):
		dir.make_dir("recipeImages")

func saveRecipeImage(originalPath):
	ensureImageFolder()

	var fileName = originalPath.get_file()
	var newPath = "user://recipeImages/" + fileName

	DirAccess.copy_absolute(originalPath, newPath)

	return newPath

func getSelectedTags():
	var tags = []

	if $VBoxContainer/DietLabel/DietGrid/VeganCheckBox.button_pressed:
		tags.append("vegan")

	if $VBoxContainer/DietLabel/DietGrid/VegetarianCheckBox.button_pressed:
		tags.append("vegetarian")

	if $VBoxContainer/DietLabel/DietGrid/GlutenFreeCheckBox.button_pressed:
		tags.append("glutenFree")

	if $VBoxContainer/DietLabel/DietGrid/LactoseFreeCheckBox.button_pressed:
		tags.append("lactoseFree")

	if $VBoxContainer/DietLabel/DietGrid/NutFreeCheckBox.button_pressed:
		tags.append("nutFree")

	if $VBoxContainer/DietLabel/DietGrid/OrganicCheckBox.button_pressed:
		tags.append("organic")
		

	if $VBoxContainer/DietLabel/DietGrid/HighProteinCheckBox.button_pressed:
		tags.append("highProtein")

	if $VBoxContainer/DietLabel/DietGrid/PlantBasedCheckBox.button_pressed:
		tags.append("plantbased")

	if $VBoxContainer/DietLabel/DietGrid/HalalCheckBox.button_pressed:
		tags.append("halal")

	if $VBoxContainer/DietLabel/DietGrid/KosherCheckBox.button_pressed:
		tags.append("kosher")

	if $VBoxContainer/DietLabel/DietGrid/SeasonalCheckBox.button_pressed:
		tags.append("seasonal")

	return tags

func getSelectedIngredients():
	var ingredients = []

	if $IngredientLabel/GridContainer/BananaCheckBox.button_pressed:
		ingredients.append("banana")

	if $IngredientLabel/GridContainer/StrawberryCheckbox:
		ingredients.append("strawberry")

	if $IngredientLabel/GridContainer/BlueberryCheckBox.button_pressed:
		ingredients.append("blueberry")

	if $IngredientLabel/GridContainer/RaspberryCheckBox.button_pressed:
		ingredients.append("raspberry")

	if $IngredientLabel/GridContainer/BlackberryCheckBox.button_pressed:
		ingredients.append("blackberry")

	if $IngredientLabel/GridContainer/AppleCheckBox.button_pressed:
		ingredients.append("apple")

	if $IngredientLabel/GridContainer/PearCheckBox.button_pressed:
		ingredients.append("pear")

	if $IngredientLabel/GridContainer/PeachCheckBox.button_pressed:
		ingredients.append("peach")

	if $IngredientLabel/GridContainer/GreenKiwiCheckBox.button_pressed:
		ingredients.append("greenKiwi")

	if $IngredientLabel/GridContainer/GoldenKiwiCheckBox.button_pressed:
		ingredients.append("goldenKiwi")

	if $IngredientLabel/GridContainer/PineappleCheckBox.button_pressed:
		ingredients.append("pineapple")

	if $IngredientLabel/GridContainer/GreenGrapesCheckBox.button_pressed:
		ingredients.append("greenGrapes")

	if $IngredientLabel/GridContainer/RedGrapesCheckBox.button_pressed:
		ingredients.append("redGrapes")

	if $IngredientLabel/GridContainer/RaisinsCheckBox.button_pressed:
		ingredients.append("raisins")

	if $IngredientLabel/GridContainer/DatesCheckBox.button_pressed:
		ingredients.append("dates")

	if $IngredientLabel/GridContainer/GojiCheckBox.button_pressed:
		ingredients.append("goji")

	if $IngredientLabel/GridContainer/AlmondsCheckBox.button_pressed:
		ingredients.append("almonds")

	if $IngredientLabel/GridContainer/WalnutsCheckBox.button_pressed:
		ingredients.append("walnuts")

	if $IngredientLabel/GridContainer/PecanCheckBox.button_pressed:
		ingredients.append("pecans")

	if $IngredientLabel/GridContainer/HazelnutsCheckBox.button_pressed:
		ingredients.append("hazelnuts")

	if $IngredientLabel/GridContainer/CashewsCheckBox.button_pressed:
		ingredients.append("cashews")

	if $IngredientLabel/GridContainer/PistachiosCheckBox.button_pressed:
		ingredients.append("pistachios")

	if $IngredientLabel/GridContainer/MacadamiaCheckBox.button_pressed:
		ingredients.append("macadamia")

	if $IngredientLabel/GridContainer/GranolaCheckBox.button_pressed:
		ingredients.append("granola")

	if $IngredientLabel/GridContainer/CoconutCheckBox.button_pressed:
		ingredients.append("coconut")

	if $IngredientLabel/GridContainer/CacaoNibsCheckBox.button_pressed:
		ingredients.append("cacaoNibs")

	if $IngredientLabel/GridContainer/BiscuitsCheckBox.button_pressed:
		ingredients.append("biscuits")

	if $IngredientLabel/GridContainer/RiceCheckBox.button_pressed:
		ingredients.append("puffedRice")

	if $IngredientLabel/GridContainer/QuinoaCheckBox.button_pressed:
		ingredients.append("puffedQuinoa")

	if $IngredientLabel/GridContainer/CinnamonCheckBox.button_pressed:
		ingredients.append("cinnamon")

	if $IngredientLabel/GridContainer/CacaoPowderCheckBox.button_pressed:
		ingredients.append("cacaoPowder")

	if $IngredientLabel/GridContainer/JamCheckBox.button_pressed:
		ingredients.append("jam")

	if $IngredientLabel/GridContainer/HoneyCheckBox.button_pressed:
		ingredients.append("honey")

	if $IngredientLabel/GridContainer/NutButterCheckBox.button_pressed:
		ingredients.append("nutButter")

	if $IngredientLabel/GridContainer/ChocolateChipsCheckBox.button_pressed:
		ingredients.append("chocolateChips")

	if $IngredientLabel/GridContainer/MapleSyrupCheckBox.button_pressed:
		ingredients.append("mapleSyrup")

	if $IngredientLabel/GridContainer/SprinklesCheckBox.button_pressed:
		ingredients.append("sprinkles")

	if $IngredientLabel/GridContainer/BrownSugarCheckBox.button_pressed:
		ingredients.append("brownSugar")
	return ingredients


func _on_home_menu_button_pressed():
	get_tree().change_scene_to_file("res://filters.tscn")
