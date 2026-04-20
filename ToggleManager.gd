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
	},
	"ingredients": {
		"include": [],
		"exclude": [] 
		}
	}

var allDishes = [
	{
		"name": "Strawberry Yogurt",
		"tags": ["yogurt", "vegetarian", "glutenFree", "highProtein"],
		"ingredients": ["granola", "strawberry", "hazelnuts", "chiaseeds", "sprinkles"]
		
	},
	{
		"name": "Vegan Oatmeal Bowl",
		"tags": ["oatmeal", "vegan", "plantBased", "organic"],
		"ingredients": ["flaxseeds", "banana", "jam", "macadamia"]
	},
	{
		"name": "Holiday Special",
		"tags": ["other", "seasonal", "nutFree"],
		"ingredients": ["kiwi", "goldenkiwi", "sprinkles", "strawberry", "pistachios"]
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

func _on_banana_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("banana")
	else:
		activeFilters["ingredients"]["include"].erase("banana")
	apply_filters()


func _on_strawberry_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("strawberry")
	else:
		activeFilters["ingredients"]["include"].erase("strawberry")
	apply_filters()

func _on_blueberry_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("blueberry")
	else:
		activeFilters["ingredients"]["include"].erase("blueberry")
	apply_filters()

func _on_raspberry_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("raspberry")
	else:
		activeFilters["ingredients"]["include"].erase("raspberry")
	apply_filters()


func _on_blackberry_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("blackberry")
	else:
		activeFilters["ingredients"]["include"].erase("blackberry")
	apply_filters()


func _on_apple_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("apple")
	else:
		activeFilters["ingredients"]["include"].erase("apple")
	apply_filters()

func _on_pear_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("pear")
	else:
		activeFilters["ingredients"]["include"].erase("pear")
	apply_filters()

func _on_peach_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("peach")
	else:
		activeFilters["ingredients"]["include"].erase("peach")
	apply_filters()


func _on_green_kiwi_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("greenKiwi")
	else:
		activeFilters["ingredients"]["include"].erase("greenKiwi")
	apply_filters()


func _on_golden_kiwi_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("goldenKiwi")
	else:
		activeFilters["ingredients"]["include"].erase("goldenKiwi")
	apply_filters()


func _on_pineapple_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("pineapple")
	else:
		activeFilters["ingredients"]["include"].erase("pineapple")
	apply_filters()


func _on_green_grapes_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("greenGrapes")
	else:
		activeFilters["ingredients"]["include"].erase("greenGrapes")
	apply_filters()


func _on_red_grapes_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("redGrapes")
	else:
		activeFilters["ingredients"]["include"].erase("redGrapes")
	apply_filters()


func _on_raisins_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("raisins")
	else:
		activeFilters["ingredients"]["include"].erase("raisins")
	apply_filters()


func _on_dates_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("dates")
	else:
		activeFilters["ingredients"]["include"].erase("dates")
	apply_filters()


func _on_cranberry_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("cranberry")
	else:
		activeFilters["ingredients"]["include"].erase("cranberry")
	apply_filters()


func _on_goji_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("goji")
	else:
		activeFilters["ingredients"]["include"].erase("goji")
	apply_filters()


func _on_almonds_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("almonds")
	else:
		activeFilters["ingredients"]["include"].erase("almonds")
	apply_filters()


func _on_walnuts_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("walnuts")
	else:
		activeFilters["ingredients"]["include"].erase("walnuts")
	apply_filters()


func _on_pecans_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("pecans")
	else:
		activeFilters["ingredients"]["include"].erase("pecans")
	apply_filters()


func _on_hazelnuts_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("hazelnuts")
	else:
		activeFilters["ingredients"]["include"].erase("hazelnuts")
	apply_filters()


func _on_cashews_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("cashews")
	else:
		activeFilters["ingredients"]["include"].erase("cashews")
	apply_filters()


func _on_pistachios_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("pistachios")
	else:
		activeFilters["ingredients"]["include"].erase("pistachios")
	apply_filters()


func _on_macadamia_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("macadamia")
	else:
		activeFilters["ingredients"]["include"].erase("macadamia")
	apply_filters()


func _on_granola_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("granola")
	else:
		activeFilters["ingredients"]["include"].erase("granola")
	apply_filters()


func _on_coconut_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("coconut")
	else:
		activeFilters["ingredients"]["include"].erase("coconut")
	apply_filters()


func _on_cacao_nibs_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("cacao")
	else:
		activeFilters["ingredients"]["include"].erase("cacao")
	apply_filters()


func _on_biscuits_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("biscuits")
	else:
		activeFilters["ingredients"]["include"].erase("biscuits")
	apply_filters()


func _on_rice_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("rice")
	else:
		activeFilters["ingredients"]["include"].erase("rice")
	apply_filters()


func _on_quinoa_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("quinoa")
	else:
		activeFilters["ingredients"]["include"].erase("quinoa")
	apply_filters()


func _on_cinnamon_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("cinnamon")
	else:
		activeFilters["ingredients"]["include"].erase("cinnamon")
	apply_filters()


func _on_cacao_powder_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("cacaopowder")
	else:
		activeFilters["ingredients"]["include"].erase("cacaopowder")
	apply_filters()


func _on_jam_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("jam")
	else:
		activeFilters["ingredients"]["include"].erase("jam")
	apply_filters()


func _on_honey_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("honey")
	else:
		activeFilters["ingredients"]["include"].erase("honey")
	apply_filters()


func _on_nut_butter_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("nutButter")
	else:
		activeFilters["ingredients"]["include"].erase("nutButter")
	apply_filters()


func _on_chocolate_chips_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("chocolateChips")
	else:
		activeFilters["ingredients"]["include"].erase("chocolateChips")
	apply_filters()


func _on_maple_syrup_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("mapleSyrup")
	else:
		activeFilters["ingredients"]["include"].erase("mapleSyrup")
	apply_filters()

func _on_sprinkles_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("sprinkles")
	else:
		activeFilters["ingredients"]["include"].erase("sprinkles")
	apply_filters()


func _on_brown_sugar_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("brownSugar")
	else:
		activeFilters["ingredients"]["include"].erase("brownSugar")
	apply_filters()
