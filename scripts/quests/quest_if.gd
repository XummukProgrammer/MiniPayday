class_name quest_if extends quest

# Какую цепочку квестов загружать при true
export (Resource) var _true_quest

# Какую цепочку квестов загружать при false
export (Resource) var _false_quest

# Возвращает цепочку квестов при true
func get_true_quest() -> quest_queue:
	return _true_quest as quest_queue
	
# Возвращает цепочку квестов при false
func get_false_quest() -> quest_queue:
	return _false_quest as quest_queue

# Условие по использованию true цепочки.
# Принимается решение в наследниках.
func is_true_quest() -> bool:
	return false

# Условие по использованию false цепочки.
# Принимается решение в наследниках.
func is_false_quest() -> bool:
	return false

# Возвращает цепочку квестов по условию.
func get_current_quest() -> quest_queue:
	if is_true_quest():
		return get_true_quest()
	elif is_false_quest():
		return get_false_quest()
	return null

# Возвращает идентификатор квеста
func get_id() -> String:
	var current_quest = get_current_quest()
	if current_quest:
		return current_quest.get_id()
	return ""

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
