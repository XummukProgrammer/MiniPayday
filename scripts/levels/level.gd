class_name level extends Resource

# Идентификатор уровня
export var _id = "level_1"

# Путь до сцены
export var _scene_path = "res://scenes/test/level_1.tscn"

# Квесты на уровне
export (Resource) var _quests_data

# Сцена
var _scene: level_scene

# Получить идентификатор уровня
func get_id() -> String:
	return _id

# Получить игрока
func get_player() -> Node:
	if _scene:
		return _scene.get_player()
	return null

# Получить сцену
func get_scene() -> level_scene:
	return _scene

# Создание уровня
func on_create():
	_load_scene()
	_load_quests()
	
# Выход с уровня
func on_exit():
	_clear()
	
# Обновление
func update():
	pass

# Загрузка сцены
func _load_scene():
	_scene = ResourceLoader.load(_scene_path).instance()
	_scene.add_to_main_scene()

# Загрузка квестов
func _load_quests():
	GlobalVariables.get_main().get_quests().load_quests(_quests_data)

# Очистка данных
func _clear():
	# Очищаем ноду текущего уровня
	_scene.remove_from_main_scene()
	_scene = null
