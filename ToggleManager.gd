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
# 🧂 INGREDIENT CHECKS
# -------------------------

# ✅ INCLUDE (must have ALL)
		var includeMatch = true
		for ingredient in activeFilters["ingredients"]["include"]:
			if ingredient not in dish["ingredients"]:
				includeMatch = false
				break

# ❌ EXCLUDE (must have NONE)
		var excludeMatch = true
		for ingredient in activeFilters["ingredients"]["exclude"]:
			if ingredient in dish["ingredients"]:
				excludeMatch = false
				break

		# -------------------------
		# ✅ FINAL
		# -------------------------
		if typeMatch and dietMatch and includeMatch and excludeMatch:
			filteredDishes.append(dish)
		
		

	print("Filtered dishes: ", filteredDishes)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://recipebook.tscn")

func _on_banana_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("banana")
		activeFilters["ingredients"]["exclude"].erase("banana")
	else:
		activeFilters["ingredients"]["include"].erase("banana")
	apply_filters()


func _on_strawberry_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("strawberry")
		activeFilters["ingredients"]["exclude"].erase("strawberry")
	else:
		activeFilters["ingredients"]["include"].erase("strawberry")
	apply_filters()

func _on_blueberry_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("blueberry")
		activeFilters["ingredients"]["exclude"].erase("blueberry")
	else:
		activeFilters["ingredients"]["include"].erase("blueberry")
	apply_filters()

func _on_raspberry_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("raspberry")
		activeFilters["ingredients"]["exclude"].erase("raspberry")
	else:
		activeFilters["ingredients"]["include"].erase("raspberry")
	apply_filters()


func _on_blackberry_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("blackberry")
		activeFilters["ingredients"]["exclude"].erase("blackberry")
	else:
		activeFilters["ingredients"]["include"].erase("blackberry")
	apply_filters()


func _on_apple_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("apple")
		activeFilters["ingredients"]["exclude"].erase("apple")
	else:
		activeFilters["ingredients"]["include"].erase("apple")
	apply_filters()

func _on_pear_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("pear")
		activeFilters["ingredients"]["exclude"].erase("pear")
	else:
		activeFilters["ingredients"]["include"].erase("pear")
	apply_filters()

func _on_peach_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("peach")
		activeFilters["ingredients"]["exclude"].erase("peach")
	else:
		activeFilters["ingredients"]["include"].erase("peach")
	apply_filters()


func _on_green_kiwi_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("greenKiwi")
		activeFilters["ingredients"]["exclude"].erase("greenKiwi")
	else:
		activeFilters["ingredients"]["include"].erase("greenKiwi")
	apply_filters()


func _on_golden_kiwi_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("goldenKiwi")
		activeFilters["ingredients"]["exclude"].erase("goldenKiwi")
	else:
		activeFilters["ingredients"]["include"].erase("goldenKiwi")
	apply_filters()


func _on_pineapple_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("pineapple")
		activeFilters["ingredients"]["exclude"].erase("pineapple")
	else:
		activeFilters["ingredients"]["include"].erase("pineapple")
	apply_filters()


func _on_green_grapes_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("greenGrapes")
		activeFilters["ingredients"]["exclude"].erase("greenGrapes")
	else:
		activeFilters["ingredients"]["include"].erase("greenGrapes")
	apply_filters()


func _on_red_grapes_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("redGrapes")
		activeFilters["ingredients"]["exclude"].erase("redGrapes")
	else:
		activeFilters["ingredients"]["include"].erase("redGrapes")
	apply_filters()


func _on_raisins_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("raisins")
		activeFilters["ingredients"]["exclude"].erase("raisins")
	else:
		activeFilters["ingredients"]["include"].erase("raisins")
	apply_filters()


func _on_dates_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("dates")
		activeFilters["ingredients"]["exclude"].erase("dates")
	else:
		activeFilters["ingredients"]["include"].erase("dates")
	apply_filters()


func _on_cranberry_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("cranberry")
		activeFilters["ingredients"]["exclude"].erase("cranberry")
	else:
		activeFilters["ingredients"]["include"].erase("cranberry")
	apply_filters()


func _on_goji_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("goji")
		activeFilters["ingredients"]["exclude"].erase("goji")
	else:
		activeFilters["ingredients"]["include"].erase("goji")
	apply_filters()


func _on_almonds_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("almonds")
		activeFilters["ingredients"]["exclude"].erase("almonds")
	else:
		activeFilters["ingredients"]["include"].erase("almonds")
	apply_filters()


func _on_walnuts_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("walnuts")
		activeFilters["ingredients"]["exclude"].erase("walnuts")
	else:
		activeFilters["ingredients"]["include"].erase("walnuts")
	apply_filters()


func _on_pecans_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("pecans")
		activeFilters["ingredients"]["exclude"].erase("pecans")
	else:
		activeFilters["ingredients"]["include"].erase("pecans")
	apply_filters()


func _on_hazelnuts_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("hazelnuts")
		activeFilters["ingredients"]["exclude"].erase("hazelnuts")
	else:
		activeFilters["ingredients"]["include"].erase("hazelnuts")
	apply_filters()


func _on_cashews_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("cashews")
		activeFilters["ingredients"]["exclude"].erase("cashews")
	else:
		activeFilters["ingredients"]["include"].erase("cashews")
	apply_filters()


func _on_pistachios_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("pistachios")
		activeFilters["ingredients"]["exclude"].erase("pistachios")
	else:
		activeFilters["ingredients"]["include"].erase("pistachios")
	apply_filters()


func _on_macadamia_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("macadamia")
		activeFilters["ingredients"]["exclude"].erase("macadamia")
	else:
		activeFilters["ingredients"]["include"].erase("macadamia")
	apply_filters()


func _on_granola_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("granola")
		activeFilters["ingredients"]["exclude"].erase("granola")
	else:
		activeFilters["ingredients"]["include"].erase("granola")
	apply_filters()


func _on_coconut_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("coconut")
		activeFilters["ingredients"]["exclude"].erase("coconut")
	else:
		activeFilters["ingredients"]["include"].erase("coconut")
	apply_filters()


func _on_cacao_nibs_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("cacao")
		activeFilters["ingredients"]["exclude"].erase("cacao")
	else:
		activeFilters["ingredients"]["include"].erase("cacao")
	apply_filters()


func _on_biscuits_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("biscuits")
		activeFilters["ingredients"]["exclude"].erase("biscuits")
	else:
		activeFilters["ingredients"]["include"].erase("biscuits")
	apply_filters()


func _on_rice_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("rice")
		activeFilters["ingredients"]["exclude"].erase("rice")
	else:
		activeFilters["ingredients"]["include"].erase("rice")
	apply_filters()


func _on_quinoa_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("quinoa")
		activeFilters["ingredients"]["exclude"].erase("quinoa")
	else:
		activeFilters["ingredients"]["include"].erase("quinoa")
	apply_filters()


func _on_cinnamon_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("cinnamon")
		activeFilters["ingredients"]["exclude"].erase("cinnamon")
	else:
		activeFilters["ingredients"]["include"].erase("cinnamon")
	apply_filters()


func _on_cacao_powder_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("cacaopowder")
		activeFilters["ingredients"]["exclude"].erase("cacaopowder")
	else:
		activeFilters["ingredients"]["include"].erase("cacaopowder")
	apply_filters()


func _on_jam_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("jam")
		activeFilters["ingredients"]["exclude"].erase("jam")
	else:
		activeFilters["ingredients"]["include"].erase("jam")
	apply_filters()


func _on_honey_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("honey")
		activeFilters["ingredients"]["exclude"].erase("honey")
	else:
		activeFilters["ingredients"]["include"].erase("honey")
	apply_filters()


func _on_nut_butter_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("nutButter")
		activeFilters["ingredients"]["exclude"].erase("nutButter")
	else:
		activeFilters["ingredients"]["include"].erase("nutButter")
	apply_filters()


func _on_chocolate_chips_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("chocolateChips")
		activeFilters["ingredients"]["exclude"].erase("chocolateChips")
	else:
		activeFilters["ingredients"]["include"].erase("chocolateChips")
	apply_filters()


func _on_maple_syrup_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("mapleSyrup")
		activeFilters["ingredients"]["exclude"].erase("mapleSyrup")
	else:
		activeFilters["ingredients"]["include"].erase("mapleSyrup")
	apply_filters()

func _on_sprinkles_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("sprinkles")
		activeFilters["ingredients"]["exclude"].erase("sprinkles")
	else:
		activeFilters["ingredients"]["include"].erase("sprinkles")
	apply_filters()


func _on_brown_sugar_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["include"].append("brownSugar")
		activeFilters["ingredients"]["exclude"].erase("brownSugar")
	else:
		activeFilters["ingredients"]["include"].erase("brownSugar")
	apply_filters()


func _on_banana_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("banana")
		activeFilters["ingredients"]["include"].erase("banana")
	else:
		activeFilters["ingredients"]["exclude"].erase("banana")
	apply_filters()


func _on_strawberry_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("strawberry")
		activeFilters["ingredients"]["include"].erase("strawberry")
	else:
		activeFilters["ingredients"]["exclude"].erase("strawberry")
	apply_filters()


func _on_blueberry_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("blueberry")
		activeFilters["ingredients"]["include"].erase("blueberry")
	else:
		activeFilters["ingredients"]["exclude"].erase("blueberry")
	apply_filters()


func _on_raspberry_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("raspberry")
		activeFilters["ingredients"]["include"].erase("raspberry")
	else:
		activeFilters["ingredients"]["exclude"].erase("raspberry")
	apply_filters()


func _on_blackberry_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("blackberry")
		activeFilters["ingredients"]["include"].erase("blackberry")
	else:
		activeFilters["ingredients"]["exclude"].erase("blackberry")
	apply_filters()


func _on_apple_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("apple")
		activeFilters["ingredients"]["include"].erase("apple")
	else:
		activeFilters["ingredients"]["exclude"].erase("apple")
	apply_filters()


func _on_pear_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("pear")
		activeFilters["ingredients"]["include"].erase("pear")
	else:
		activeFilters["ingredients"]["exclude"].erase("pear")
	apply_filters()


func _on_peach_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("peach")
		activeFilters["ingredients"]["include"].erase("peach")
	else:
		activeFilters["ingredients"]["exclude"].erase("peach")
	apply_filters()


func _on_green_kiwi_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("greenKiwi")
		activeFilters["ingredients"]["include"].erase("greenKiwi")
	else:
		activeFilters["ingredients"]["exclude"].erase("greenKiwi")
	apply_filters()


func _on_golden_kiwi_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("goldenKiwi")
		activeFilters["ingredients"]["include"].erase("goldenKiwi")
	else:
		activeFilters["ingredients"]["exclude"].erase("goldenKiwi")
	apply_filters()


func _on_pineapple_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("pineapple")
		activeFilters["ingredients"]["include"].erase("pineapple")
	else:
		activeFilters["ingredients"]["exclude"].erase("pineapple")
	apply_filters()


func _on_green_grapes_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("greenGrapes")
		activeFilters["ingredients"]["include"].erase("greenGrapes")
	else:
		activeFilters["ingredients"]["exclude"].erase("greenGrapes")
	apply_filters()


func _on_red_grapes_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("redGrapes")
		activeFilters["ingredients"]["include"].erase("redGrapes")
	else:
		activeFilters["ingredients"]["exclude"].erase("redGrapes")
	apply_filters()


func _on_raisins_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("raisins")
		activeFilters["ingredients"]["include"].erase("raisins")
	else:
		activeFilters["ingredients"]["exclude"].erase("raisins")
	apply_filters()


func _on_dates_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("dates")
		activeFilters["ingredients"]["include"].erase("dates")
	else:
		activeFilters["ingredients"]["exclude"].erase("dates")
	apply_filters()

func _on_cranberry_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("cranberry")
		activeFilters["ingredients"]["include"].erase("cranberry")
	else:
		activeFilters["ingredients"]["exclude"].erase("cranberry")
	apply_filters()


func _on_goji_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("goji")
		activeFilters["ingredients"]["include"].erase("goji")
	else:
		activeFilters["ingredients"]["exclude"].erase("goji")
	apply_filters()


func _on_almonds_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("almonds")
		activeFilters["ingredients"]["include"].erase("almonds")
	else:
		activeFilters["ingredients"]["exclude"].erase("almonds")
	apply_filters()


func _on_walnuts_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("walnuts")
		activeFilters["ingredients"]["include"].erase("walnuts")
	else:
		activeFilters["ingredients"]["exclude"].erase("walnuts")
	apply_filters()


func _on_pecans_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("pecans")
		activeFilters["ingredients"]["include"].erase("pecans")
	else:
		activeFilters["ingredients"]["exclude"].erase("pecans")
	apply_filters()


func _on_hazelnuts_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("hazelnuts")
		activeFilters["ingredients"]["include"].erase("hazelnuts")
	else:
		activeFilters["ingredients"]["exclude"].erase("hazelnuts")
	apply_filters()


func _on_cashews_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("cashews")
		activeFilters["ingredients"]["include"].erase("cashews")
	else:
		activeFilters["ingredients"]["exclude"].erase("cashews")
	apply_filters()


func _on_pistachios_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("pistachios")
		activeFilters["ingredients"]["include"].erase("pistachios")
	else:
		activeFilters["ingredients"]["exclude"].erase("pistachios")
	apply_filters()


func _on_macadamia_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("macadamia")
		activeFilters["ingredients"]["include"].erase("macadamia")
	else:
		activeFilters["ingredients"]["exclude"].erase("macadamia")
	apply_filters()


func _on_granola_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("granola")
		activeFilters["ingredients"]["include"].erase("granola")
	else:
		activeFilters["ingredients"]["exclude"].erase("granola")
	apply_filters()


func _on_coconut_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("coconut")
		activeFilters["ingredients"]["include"].erase("coconut")
	else:
		activeFilters["ingredients"]["exclude"].erase("coconut")
	apply_filters()


func _on_cacao_nibs_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("cacao")
		activeFilters["ingredients"]["include"].erase("cacao")
	else:
		activeFilters["ingredients"]["exclude"].erase("cacao")
	apply_filters()


func _on_biscuits_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("biscuits")
		activeFilters["ingredients"]["include"].erase("biscuits")
	else:
		activeFilters["ingredients"]["exclude"].erase("biscuits")
	apply_filters()


func _on_rice_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("rice")
		activeFilters["ingredients"]["include"].erase("rice")
	else:
		activeFilters["ingredients"]["exclude"].erase("rice")
	apply_filters()


func _on_quinoa_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("quinoa")
		activeFilters["ingredients"]["include"].erase("quinoa")
	else:
		activeFilters["ingredients"]["exclude"].erase("quinoa")
	apply_filters()


func _on_cinnamon_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("cinnamon")
		activeFilters["ingredients"]["include"].erase("cinnamon")
	else:
		activeFilters["ingredients"]["exclude"].erase("cinnamon")
	apply_filters()


func _on_cacao_powder_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("cacaopowder")
		activeFilters["ingredients"]["include"].erase("cacaopowder")
	else:
		activeFilters["ingredients"]["exclude"].erase("cacaopowder")
	apply_filters()


func _on_jam_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("jam")
		activeFilters["ingredients"]["include"].erase("jam")
	else:
		activeFilters["ingredients"]["exclude"].erase("jam")
	apply_filters()


func _on_honey_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("honey")
		activeFilters["ingredients"]["include"].erase("honey")
	else:
		activeFilters["ingredients"]["exclude"].erase("honey")
	apply_filters()


func _on_nut_butters_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("nutButters")
		activeFilters["ingredients"]["include"].erase("nutButters")
	else:
		activeFilters["ingredients"]["exclude"].erase("nutButters")
	apply_filters()


func _on_chocolate_chips_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("chocolateChips")
		activeFilters["ingredients"]["include"].erase("chocolateChips")
	else:
		activeFilters["ingredients"]["exclude"].erase("chocolateChips")
	apply_filters()


func _on_maple_syrup_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("mapleSyrup")
		activeFilters["ingredients"]["include"].erase("mapleSyrup")
	else:
		activeFilters["ingredients"]["exclude"].erase("mapleSyrup")
	apply_filters()


func _on_sprinkles_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("sprinkles")
		activeFilters["ingredients"]["include"].erase("sprinkles")
	else:
		activeFilters["ingredients"]["exclude"].erase("sprinkles")
	apply_filters()


func _on_brown_sugar_exclude_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["ingredients"]["exclude"].append("brownSugar")
		activeFilters["ingredients"]["include"].erase("brownSugar")
	else:
		activeFilters["ingredients"]["exclude"].erase("brownSugar")
	apply_filters()
