class_name main extends Node2D

onready var _camera = $camera
onready var _player = $sort_objects/player
onready var _quests = $quests
onready var _current_quest = $CanvasLayer/Label

# Получить камеру
func get_camera() -> Node2D:
	return _camera

# Получить игрока
func get_player() -> Node2D:
	return _player

# Получить квесты
func get_quests() -> quests:
	return _quests as quests

# Произошла отправка сообщения
func on_message_sent(who: Node2D, body: Node2D, text: String):
	for condition in GlobalVariables.get_conditions():
		condition.on_message_sent(who, body, text)

# Произошла загрузка уровня.
# Предварительно добавил сюда, в будущем будет система уровней.
func on_load_level():
	# Сохраняем main для удобного обращения к нему из других классов.
	GlobalVariables.set_main(self)
	
	# Камере устанавливаем игрока. Также предварительный вариант,
	# в будущем будет дорабатываться.
	_camera.set_target_object(_player)
	
	# Подписываемся на установку квеста
	_quests.connect("current_quest_updated", self, "on_current_quest_updated")

# Квест был обновлён
func on_current_quest_updated(quest_id: String):
	_current_quest.text = "Current Quest: %s" % quest_id

func _ready():
	on_load_level()
