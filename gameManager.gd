extends Node

var collectedItems = {}
var usedItems = {}

func set_item_collected(itemId:String, value:bool):
	collectedItems[itemId] = value

func is_item_collected(itemId:String) -> bool:
	return collectedItems.get(itemId, false)

func set_item_used(itemId:String, value:bool):
	usedItems[itemId] = value

func is_item_used(itemId:String) -> bool:
	return usedItems.get(itemId, false)
