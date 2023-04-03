class_name main extends Node2D

onready var _camera = $camera
onready var _quests = $quests
onready var _levels = $levels
onready var _current_quest = $CanvasLayer/Label

# Получить камеру
func get_camera() -> Node2D:
	return _camera

# Получить квесты
func get_quests() -> quests:
	return _quests as quests
	
# Получить уровни
func get_levels() -> levels:
	return _levels

# Получить сцену текущего уровня
func get_current_level_scene() -> Node:
	if _levels:
		var current_level = _levels.get_current_level()
		if current_level:
			return current_level.get_scene()
	return null

# Произошла отправка сообщения
func on_message_sent(who: Node2D, body: Node2D, text: String):
	for condition in GlobalVariables.get_conditions():
		condition.on_message_sent(who, body, text)

# Квест был обновлён
func on_current_quest_updated(quest_id: String):
	_current_quest.text = "Current Quest: %s" % quest_id

func _ready():
	# Сохраняем main для удобного обращения к нему из других классов.
	GlobalVariables.set_main(self)

	# Подписываемся на установку квеста
	_quests.connect("current_quest_updated", self, "on_current_quest_updated")
	
	# Загружаем уровень по умолчанию
	_levels.play_default()
