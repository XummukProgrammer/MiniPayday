class_name quests extends Node

# Сигнал на обновление текущего квеста
# quest_id: String - идентификатор квеста
signal current_quest_updated(quest_id)

# Сигнал на выполнение квеста.
# q: quest - объект квеста
signal quest_completed(q)

# Базовый квест (стартовый)
export (Resource) var _base_quest

# Идентификатор текущего квеста
var _current_quest_id = ""

# Выполненные квесты
var _completed_quests = Array()

# Возвращает базовую цепочку квестов
func get_base_quest() -> quest_queue:
	return _base_quest as quest_queue

# Устанавливает идентификатор текущего квеста
func set_current_quest_id(id: String):
	_on_current_quest_updated(id)
	
# Возвращает идентификатор текущего квеста
func get_current_quest_id() -> String:
	return _current_quest_id

# Функция вызывается при обновлении квестов
func update():
	var base_quest = get_base_quest()
	if base_quest:
		base_quest.update()

# Функция вызывается при выполнении квеста
func on_quest_completed(q: quest):
	_completed_quests.push_back(q.get_id())
	emit_signal("quest_completed", q)
	
# Функция вызывается при обновлении идентификатора текущего квеста
func _on_current_quest_updated(quest_id: String):
	_current_quest_id = quest_id
	emit_signal("current_quest_updated", quest_id)

# Проверяет выполнен ли квест
func is_quest_completed(quest_id: String) -> bool:
	return _completed_quests.has(quest_id)

func _process(delta):
	update()
