extends Node

var collectedItems = {}

func set_item_collected(itemId:String, value:bool):
	collectedItems[itemId] = value

func is_item_collected(itemId:String) -> bool:
	return collectedItems.get(itemId, false)
