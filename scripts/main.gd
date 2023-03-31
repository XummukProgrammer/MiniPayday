class_name main extends Node2D

onready var _camera = $camera
onready var _player = $sort_objects/player
onready var _quests = $quests

# Получить камеру
func get_camera() -> Node2D:
	return _camera

# Получить игрока
func get_player() -> Node2D:
	return _player

# Получить квесты
func get_quests() -> quests:
	return _quests as quests

# Пересечение игрока с областью Area2D
func on_quest_area2d_trigger_body_entered(body, name):
	if _player.name == body.name:
		for condition in GlobalVariables.get_conditions():
			condition.on_player_area_entered(name)

# Произошла загрузка уровня.
# Предварительно добавил сюда, в будущем будет система уровней.
func on_load_level():
	# Сохраняем main для удобного обращения к нему из других классов.
	GlobalVariables.set_main(self)
	
	# Камере устанавливаем игрока. Также предварительный вариант,
	# в будущем будет дорабатываться.
	_camera.set_target_object(_player)

func _ready():
	on_load_level()
