extends Node2D

var activeFilters = {
	"yogurt": false,
	"oatmeal": false,
	"other": false
}

var allDishes = [
	{ "name": "Strawberry Yogurt", "type": "yogurt" },
	{ "name": "Banana Oatmeal", "type": "oatmeal" },
	{ "name": "Chocolate Yogurt", "type": "yogurt" },
	{ "name": "Mystery Dish", "type": "other" }
]

func _ready():
	pass 

func _process(delta):
	pass

func _on_all_button_toggled(toggled_on):
	if toggled_on:
		activeFilters["yogurt"] = false
		activeFilters["oatmeal"] = false
		activeFilters["other"] = false
		$TabContainer/Type/YogurtButton.button_pressed = false
		$TabContainer/Type/OatmealButton.button_pressed = false
		$TabContainer/Type/OtherButton.button_pressed = false
	
	apply_filters()

func _on_yogurt_button_toggled(toggled_on):
	activeFilters["yogurt"] = toggled_on
	
	if toggled_on:
		$TabContainer/Type/AllButton.button_pressed = false
	
	apply_filters()

func _on_oatmeal_button_toggled(toggled_on):
	activeFilters["oatmeal"] = toggled_on
	
	if toggled_on:
		$TabContainer/Type/AllButton.button_pressed = false
	
	apply_filters()

func _on_other_button_toggled(toggled_on):
	activeFilters["other"] = toggled_on
	
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

func _on_vegan_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false

func _on_gf_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false

func _on_lf_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false

func _on_nut_free_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false

func _on_sugars_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false

func _on_organic_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false

func _on_protein_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false

func _on_plant_based_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false

func _on_halal_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false

func _on_kosher_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false

func _on_seasonal_button_toggled(toggled_on):
	$"TabContainer/Diet preferences/NoneButton".button_pressed = false

func apply_filters():
	var filteredDishes = []
	var anyFilterActive = false
	
	for key in activeFilters:
		if activeFilters[key]:
			anyFilterActive = true
			break
	
	for dish in allDishes:
		if $TabContainer/Type/AllButton.button_pressed or not anyFilterActive:
			filteredDishes.append(dish)
		else:
			if activeFilters[dish["type"]]:
				filteredDishes.append(dish)
	
	print("Filtered dishes: ", filteredDishes)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://recipebook.tscn")
