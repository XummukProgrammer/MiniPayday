class_name quests extends Node

# Сигнал на выполнение квеста.
# q: quest - объект квеста
signal quest_completed(q)

# Базовый квест (стартовый)
export (Resource) var _base_quest

# Выполненные квесты
var _completed_quests = Array()

# Возвращает базовую цепочку квестов
func get_base_quest() -> quest_queue:
	return _base_quest as quest_queue

# Функция вызывается при обновлении квестов
func update():
	var base_quest = get_base_quest()
	if base_quest:
		base_quest.update()

# Функция вызывается при выполнении квеста
func on_quest_completed(q: quest):
	emit_signal("quest_completed", q)
	_completed_quests.push_back(q.get_id())

# Проверяет выполнен ли квест
func is_quest_completed(quest_id: String) -> bool:
	return _completed_quests.has(quest_id)

func _process(delta):
	update()
