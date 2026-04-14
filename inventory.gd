extends Node

var collectedItems = {}

func add_item(itemName):
	collectedItems[itemName] = true

func has_item(itemName):
	return collectedItems.has(itemName)
