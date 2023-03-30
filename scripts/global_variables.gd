extends Node

# Название приложения
var _application_name = "application_name"

# Кондишены
var _conditions = Array()

# Устанавливает название приложения
func set_application_name(name: String):
	_application_name = name

# Возвращает название приложения
func get_application_name() -> String:
	return _application_name

# Добавить кондишен
func add_condition(condition):
	_conditions.push_back(condition)
	
# Получить все кондишены
func get_conditions() -> Array:
	return _conditions
