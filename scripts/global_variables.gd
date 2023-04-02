extends Node

# Main класс
var _main: main

# Кондишены
var _conditions = Array()

# Установить main
func set_main(m: main):
	_main = m
	
# Получить main
func get_main() -> main:
	return _main

# Добавить кондишен
func add_condition(condition):
	_conditions.push_back(condition)
	
# Получить все кондишены
func get_conditions() -> Array:
	return _conditions
