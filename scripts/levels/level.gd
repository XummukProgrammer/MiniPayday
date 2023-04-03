class_name level extends Resource

# Идентификатор уровня
export var _id = "level_1"

# Путь до сцены
export var _scene_path = "res://scenes/test/level_1.tscn"

# Путь до игрока
export var _player_path: NodePath

# Квесты на уровне
export (Resource) var _quests_data

# Игрок
var _player: Node2D

# Сцена
var _scene: Node

# Получить идентификатор уровня
func get_id() -> String:
	return _id

# Получить игрока
func get_player() -> Node2D:
	return _player

# Получить сцену
func get_scene() -> Node:
	return _scene

# Создание уровня
func on_create():
	_load_scene()
	_load_objects()
	_load_quests()
	
# Выход с уровня
func on_exit():
	pass
	
# Обновление
func update():
	pass

# Загрузка сцены
func _load_scene():
	_scene = ResourceLoader.load(_scene_path).instance()
	GlobalVariables.get_main().get_node("levels").add_child(_scene)

# Загрузка важных объектов
func _load_objects():
	var path = "levels/" + _id + "/" + _player_path
	_player = GlobalVariables.get_main().get_node(path) as Node2D
	
	# Устанавливаем камеру на игрока
	GlobalVariables.get_main().get_camera().set_target_object(_player)
	
# Загрузка квестов
func _load_quests():
	GlobalVariables.get_main().get_quests().load_quests(_quests_data)
