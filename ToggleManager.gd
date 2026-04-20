extends Node2D

var activeFilters = {
	"type": {
		"yogurt": false,
		"oatmeal": false,
		"other": false
	},
	"diet": {
		"vegetarian": false,
		"vegan": false,
		"glutenFree": false,
		"lactoseFree": false,
		"nutFree": false,
		"noArtificial": false,
		"organic": false,
		"highProtein": false,
		"plantBased": false,
		"halal": false,
		"kosher": false,
		"seasonal": false
	}
}

var allDishes = [
	{
		"name": "Strawberry Yogurt",
		"tags": ["yogurt", "vegetarian", "glutenFree", "highProtein"]
	},
	{
		"name": "Vegan Oatmeal Bowl",
		"tags": ["oatmeal", "vegan", "plantBased", "organic"]
	},
	{
		"name": "Holiday Special",
		"tags": ["other", "seasonal", "nutFree"]
	}
]

func _ready():
	pass 

func _process(delta):
	pass

func _on_all_button_toggled(toggled_on):
	if toggled_on:
		if toggled_on:
			for type in activeFilters["type"]:
				activeFilters["type"][type] = false
		
		$TabContainer/Type/YogurtButton.button_pressed = false
		$TabContainer/Type/OatmealButton.button_pressed = false
		$TabContainer/Type/OtherButton.button_pressed = false
	
	apply_filters()

func _on_yogurt_button_toggled(toggled_on):
	activeFilters["type"]["yogurt"] = toggled_on
	
	if toggled_on:
		$TabContainer/Type/AllButton.button_pressed = false
	
	apply_filters()

func _on_oatmeal_button_toggled(toggled_on):
	activeFilters["type"]["oatmeal"] = toggled_on
	
	if toggled_on:
		$TabContainer/Type/AllButton.button_pressed = false
	
	apply_filters()

func _on_other_button_toggled(toggled_on):
	activeFilters["type"]["other"] = toggled_on
	
	if toggled_on:
		$TabContainer/Type/AllButton.button_pressed = false
	
	apply_filters()

func _on_none_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/VegetarianButton".button_pressed = false
	$"TabContainer/Diet preferences/VeganButton".button_pressed = false
	$"TabContainer/Diet preferences/GFButton".button_pressed = false
	$"TabContainer/Diet preferences/LFButton".button_pressed = false
	$"TabContainer/Diet preferences/NutFreeButton".button_pressed = false
	$"TabContainer/Diet preferences/SugarsButton".button_pressed = false
	$"TabContainer/Diet preferences/Organic".button_pressed = false
	$"TabContainer/Diet preferences/ProteinButton".button_pressed = false
	$"TabContainer/Diet preferences/PlantBasedButton".button_pressed = false
	$"TabContainer/Diet preferences/HalalButton".button_pressed = false
	$"TabContainer/Diet preferences/KosherButton".button_pressed = false
	$"TabContainer/Diet preferences/SeasonalButton".button_pressed = false


func _on_vegetarian_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false
	activeFilters["diet"]["vegetarian"] = toggled_on
	apply_filters()

func _on_vegan_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false
	activeFilters["diet"]["vegan"] = toggled_on
	apply_filters()

func _on_gf_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false
	activeFilters["diet"]["glutenFree"] = toggled_on
	apply_filters()

func _on_lf_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false
	activeFilters["diet"]["lactoseFree"] = toggled_on
	apply_filters()
func _on_nut_free_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false
	activeFilters["diet"]["nutFree"] = toggled_on
	apply_filters()
func _on_sugars_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false
	activeFilters["diet"]["noArtificial"] = toggled_on
	apply_filters()
func _on_organic_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false
	activeFilters["diet"]["organic"] = toggled_on
	apply_filters()
func _on_protein_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false
	activeFilters["diet"]["highProtein"] = toggled_on
	apply_filters()
func _on_plant_based_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false
	activeFilters["diet"]["plantBased"] = toggled_on
	apply_filters()

func _on_halal_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false
	activeFilters["diet"]["halal"] = toggled_on
	apply_filters()
func _on_kosher_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false
	activeFilters["diet"]["kosher"] = toggled_on
	apply_filters()
func _on_seasonal_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false
	activeFilters["diet"]["seasonal"] = toggled_on
	apply_filters()
func apply_filters():
	var filteredDishes = []
	var activeTypes = []
	var activeDiets = []

	# collect active filters
	for type in activeFilters["type"]:
		if activeFilters["type"][type]:
			activeTypes.append(type)

	for diet in activeFilters["diet"]:
		if activeFilters["diet"][diet]:
			activeDiets.append(diet)

	for dish in allDishes:

		# ✅ Show all if nothing selected OR "All" is pressed
		if $TabContainer/Type/AllButton.button_pressed \
		or (activeTypes.is_empty() and activeDiets.is_empty()):
			filteredDishes.append(dish)
			continue

		# -------------------------
		# 🥣 TYPE CHECK
		# -------------------------
		var typeMatch = false

		if activeTypes.is_empty():
			typeMatch = true
		else:
			for t in activeTypes:
				if t in dish["tags"]:
					typeMatch = true
					break

		# -------------------------
		# 🌱 DIET CHECK (AND)
		# -------------------------
		var dietMatch = true

		for d in activeDiets:
			if d not in dish["tags"]:
				dietMatch = false
				break

		# -------------------------
		# ✅ FINAL
		# -------------------------
		if typeMatch and dietMatch:
			filteredDishes.append(dish)

	print("Filtered dishes: ", filteredDishes)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://recipebook.tscn")
