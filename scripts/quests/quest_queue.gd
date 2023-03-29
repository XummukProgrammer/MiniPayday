# Класс, который хранит в себе множество других квестов.
class_name quest_queue extends quest

# Хранилище квестов.
export (Array, Resource) var _quests_data

# Текущий квест, который в процессе выполнения.
var _current_quest: quest

# Индекс текущего квеста, который в процессе выполнения.
var _current_quest_index = 0

# Статус по обновлению квестов.
enum quests_update_status { NONE, STARTED, ENDED, EXECUTED }
var _update_status = quests_update_status.NONE

# Возвращает статус по обновлению квестов.
func get_update_status():
	return _update_status
	
# Возвращает текущий квест, который в процессе выполнения.
func get_current_quest() -> quest:
	return _current_quest

# Начинаем обновление квестов с самого первого, выполненные записываем
# и переходим к следующим.
func update_quests():
	_update_status = quests_update_status.NONE
	
	# Если не инициализирован текущий квест, то инициализируем первым квестом.
	# Означает что мы начали выполнение квестов.
	if not _current_quest:
		_set_current_quest(_get_quest_by_index(0))
		
		if _current_quest:
			_update_status = quests_update_status.STARTED
		
	# Если текущий квест не проинициализирован в данном месте,
	# то либо они не были заполнены, либо все квесты выполнились.
	if not _current_quest:
		return
		
	# Проверяем выполнение квеста
	if _current_quest.is_completed():
		_current_quest_index = _current_quest_index + 1
		
		if _current_quest_index >= _quests_data.size():
			# Квесты закончились.
			_update_status = quests_update_status.ENDED
		else:
			# Переключаемся на следующий квест
			_set_current_quest(_get_quest_by_index(_current_quest_index))
		
# Устанавливает текущий квест
func _set_current_quest(quest: quest):
	_current_quest = quest
	
	# Сообщаем о запуске нового квеста
	if _current_quest:
		_update_status = quests_update_status.EXECUTED

# Возвращает квест по идентификатору
func _get_quest_by_index(index: int) -> quest:
	if _quests_data.size() > 0:
		return _quests_data[index] as quest
	else:
		return null

# Функция вызывается при столкновении игрока с area2D триггером
func on_player_area2d_triggered(name: String):
	for quest_data in _quests_data:
		(quest_data as quest).on_player_area2d_triggered(name)
