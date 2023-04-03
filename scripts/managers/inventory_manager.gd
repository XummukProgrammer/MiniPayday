extends Node

export (Array, Resource) var _items

func add_item(item : ItemResource):
	_items.append(item)
	
func get_item(index : int):
	if index < _items.size():
		return _items[index]	
	else:
		return null
		
func get_item_by_name(name : String):
	for item in _items:
		if item.get_name() == name:
			return item
	return false

func get_items_count():
	return _items.size()
	
func has_item(name : String):
	for item in _items:
		if item.get_name() == name:
			return true
	return false
