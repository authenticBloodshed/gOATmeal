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
		"name": $RecipeNameEdit.text,
		"type": $TypeOptionButton.get_item_text(
			$TypeOptionButton.selected
		),
		"tags": getSelectedTags(),
		"ingredients": getSelectedIngredients(),
		"imagePath": savedImagePath
	}

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

	if $VBoxContainer/DietLabel/DietGrid/VeganCheckBox.toggled_on:
		tags.append("vegan")

	if $VBoxContainer/DietLabel/DietGrid/VegetarianCheckBox.toggled_on:
		tags.append("vegetarian")

	if $VBoxContainer/DietLabel/DietGrid/GlutenFreeCheckBox.toggled_on:
		tags.append("glutenFree")

	if $VBoxContainer/DietLabel/DietGrid/LactoseFreeCheckBox.toggled_on:
		tags.append("lactoseFree")

	if $VBoxContainer/DietLabel/DietGrid/NutFreeCheckBox.toggled_on:
		tags.append("nutFree")

	if $VBoxContainer/DietLabel/DietGrid/OrganicCheckBox.toggled_on:
		tags.append("organic")
		

	if $VBoxContainer/DietLabel/DietGrid/HighProteinCheckBox.toggled_on:
		tags.append("highProtein")

	if $VBoxContainer/DietLabel/DietGrid/PlantBasedCheckBox.toggled_on:
		tags.append("plantbased")

	if $VBoxContainer/DietLabel/DietGrid/HalalCheckBox.toggled_on:
		tags.append("halal")

	if $VBoxContainer/DietLabel/DietGrid/KosherCheckBox.toggled_on:
		tags.append("kosher")

	if $VBoxContainer/DietLabel/DietGrid/SeasonalCheckBox.toggled_on:
		tags.append("seasonal")

	return tags

func getSelectedIngredients():
	var ingredients = []

	if $IngredientLabel/GridContainer/BananaCheckBox.toggled_on:
		ingredients.append("banana")

	if $IngredientLabel/GridContainer/StrawberryCheckbox:
		ingredients.append("strawberry")

	if $IngredientLabel/GridContainer/BlueberryCheckBox.toggled_on:
		ingredients.append("blueberry")

	if $IngredientLabel/GridContainer/RaspberryCheckBox.toggled_on:
		ingredients.append("raspberry")

	if $IngredientLabel/GridContainer/BlackberryCheckBox.toggled_on:
		ingredients.append("blackberry")

	if $IngredientLabel/GridContainer/AppleCheckBox.toggled_on:
		ingredients.append("apple")

	if $IngredientLabel/GridContainer/PearCheckBox.toggled_on:
		ingredients.append("pear")

	if $IngredientLabel/GridContainer/PeachCheckBox.toggled_on:
		ingredients.append("peach")

	if $IngredientLabel/GridContainer/GreenKiwiCheckBox.toggled_on:
		ingredients.append("greenKiwi")

	if $IngredientLabel/GridContainer/GoldenKiwiCheckBox.toggled_on:
		ingredients.append("goldenKiwi")

	if $IngredientLabel/GridContainer/PineappleCheckBox.toggled_on:
		ingredients.append("pineapple")

	if $IngredientLabel/GridContainer/GreenGrapesCheckBox.toggled_on:
		ingredients.append("greenGrapes")

	if $IngredientLabel/GridContainer/RedGrapesCheckBox.toggled_on:
		ingredients.append("redGrapes")

	if $IngredientLabel/GridContainer/RaisinsCheckBox.toggled_on:
		ingredients.append("raisins")

	if $IngredientLabel/GridContainer/DatesCheckBox.toggled_on:
		ingredients.append("dates")

	if $IngredientLabel/GridContainer/GojiCheckBox.toggled_on:
		ingredients.append("goji")

	if $IngredientLabel/GridContainer/AlmondsCheckBox.toggled_on:
		ingredients.append("almonds")

	if $IngredientLabel/GridContainer/WalnutsCheckBox.toggled_on:
		ingredients.append("walnuts")

	if $IngredientLabel/GridContainer/PecanCheckBox.toggled_on:
		ingredients.append("pecans")

	if $IngredientLabel/GridContainer/HazelnutsCheckBox.toggled_on:
		ingredients.append("hazelnuts")

	if $IngredientLabel/GridContainer/CashewsCheckBox.toggled_on:
		ingredients.append("cashews")

	if $IngredientLabel/GridContainer/PistachiosCheckBox.toggled_on:
		ingredients.append("pistachios")

	if $IngredientLabel/GridContainer/MacadamiaCheckBox.toggled_on:
		ingredients.append("macadamia")

	if $IngredientLabel/GridContainer/GranolaCheckBox.toggled_on:
		ingredients.append("granola")

	if $IngredientLabel/GridContainer/CoconutCheckBox.toggled_on:
		ingredients.append("coconut")

	if $IngredientLabel/GridContainer/CacaoNibsCheckBox.toggled_on:
		ingredients.append("cacaoNibs")

	if $IngredientLabel/GridContainer/BiscuitsCheckBox.toggled_on:
		ingredients.append("biscuits")

	if $IngredientLabel/GridContainer/RiceCheckBox.toggled_on:
		ingredients.append("puffedRice")

	if $IngredientLabel/GridContainer/QuinoaCheckBox.toggled_on:
		ingredients.append("puffedQuinoa")

	if $IngredientLabel/GridContainer/CinnamonCheckBox.toggled_on:
		ingredients.append("cinnamon")

	if $IngredientLabel/GridContainer/CacaoPowderCheckBox.toggled_on:
		ingredients.append("cacaoPowder")

	if $IngredientLabel/GridContainer/JamCheckBox.toggled_on:
		ingredients.append("jam")

	if $IngredientLabel/GridContainer/HoneyCheckBox.toggled_on:
		ingredients.append("honey")

	if $IngredientLabel/GridContainer/NutButterCheckBox.toggled_on:
		ingredients.append("nutButter")

	if $IngredientLabel/GridContainer/ChocolateChipsCheckBox.toggled_on:
		ingredients.append("chocolateChips")

	if $IngredientLabel/GridContainer/MapleSyrupCheckBox.toggled_on:
		ingredients.append("mapleSyrup")

	if $IngredientLabel/GridContainer/SprinklesCheckBox.toggled_on:
		ingredients.append("sprinkles")

	if $IngredientLabel/GridContainer/BrownSugarCheckBox.toggled_on:
		ingredients.append("brownSugar")
	return ingredients
