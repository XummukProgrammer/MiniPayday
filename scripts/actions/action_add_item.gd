class_name action_add_item extends action

# Выдаваемый предмет
export (Resource) var _item

# Получить предмет
func get_item() -> ItemResource:
	return _item as ItemResource

# Выполнение действия.
func execute():
	InventoryManager.add_item(get_item())
