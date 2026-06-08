extends Control
var recipeData

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setup(recipe):

	recipeData = recipe

	$CardButton/CardLayout/InfoVBox/RecipeName.text = recipe["name"]

	$CardButton/CardLayout/InfoVBox/RecipeTags.text = " • ".join(recipe["tags"])

	# load image
	var image = Image.new()
	image.load(recipe["imagePath"])

	var texture = ImageTexture.create_from_image(image)

	$CardButton/CardLayout/RecipeImage.texture = texture
