class_name quests extends Node

export (Resource) var _base_quest

# Возвращает базовую цепочку квестов
func get_base_quest() -> quest_queue:
	return _base_quest as quest_queue

# Функция вызывается при обновлении квестов
func update():
	var base_quest = get_base_quest()
	if base_quest:
		base_quest.update()

func _process(delta):
	update()
