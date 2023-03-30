class_name quest_if extends quest

# Загружаемые цепочки квестов
export (Array, Resource) var _quests

# Возвращает индекс цепочки по условию в наследниках
func get_current_index() -> int:
	return -1

# Возвращает цепочку квестов по условию.
func get_current_quest() -> quest_queue:
	var index = get_current_index()
	if index != -1 and index < _quests.size():
		return _quests[index] as quest_queue
	return null

# Функция вызывается при обновлении квеста
func update():
	var current_quest = get_current_quest()
	if current_quest:
		current_quest.update()

# Функция вызывается при столкновении игрока с area2D триггером
func on_player_area2d_triggered(name: String):
	var current_quest = get_current_quest()
	if current_quest:
		current_quest.on_player_area2d_triggered(name)
