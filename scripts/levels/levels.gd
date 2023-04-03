class_name levels extends Node2D

# Уровни в системе
export (Array, Resource) var _levels

# Уровень по умолчанию (При старте игры)
export var _default_level_id = "level_1"

# Текущий уровень
var _current_level: level

# Получить текущий уровень
func get_current_level() -> level:
	return _current_level

# Запуск уровня
func play(id: String):
	if _current_level:
		_current_level.on_exit()
		
	for lvl in _levels:
		if lvl.get_id() == id:
			_current_level = lvl
			_current_level.on_create()
			return
	
# Загрузка сцены по умолчанию
func play_default():
	play(_default_level_id)
	
# Обновление
func _process(delta):
	if _current_level:
		_current_level.update()
