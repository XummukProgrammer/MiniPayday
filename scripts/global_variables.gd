extends Node

# Кондишены
var _conditions = Array()

# Добавить кондишен
func add_condition(condition):
	_conditions.push_back(condition)
	
# Получить все кондишены
func get_conditions() -> Array:
	return _conditions
