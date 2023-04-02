# Класс, который хранит в себе множество других квестов.
class_name quest_queue extends quest

# Хранилище квестов.
export (Array, Resource) var _quests_data

# Текущий квест, который в процессе выполнения.
var _current_quest: quest

# Индекс текущего квеста, который в процессе выполнения.
var _current_quest_index = 0
	
# Возвращает текущий квест, который в процессе выполнения.
func get_current_quest() -> quest:
	return _current_quest

# Начинаем обновление квестов с самого первого, выполненные записываем
# и переходим к следующим.
func update():
	# Мгновенно выходим, если закончились квесты
	if _current_quest_index == -1:
		return
	
	# Если не инициализирован текущий квест, то инициализируем первым квестом.
	# Означает что мы начали выполнение квестов.
	if not _current_quest:
		_set_current_quest(_get_quest_by_index(0))
		
	# Если текущий квест не проинициализирован в данном месте,
	# то либо они не были заполнены, либо все квесты выполнились.
	if not _current_quest:
		return
		
	_current_quest.update()
		
	# Проверяем выполнение квеста
	if _current_quest.is_completed():
		_current_quest.on_completed()
		
		# Обновляем счётчик квестов
		_current_quest_index = _current_quest_index + 1
		
		if _current_quest_index >= _quests_data.size():
			# Квесты закончились.
			_current_quest_index = -1
			_current_quest = null
			
			# Цепочка завершена, не известно будет ли новая, но заранее обнуяем
			# идентификатор текущего квеста.
			GlobalVariables.get_main().get_quests().set_current_quest_id("")
		else:
			# Переключаемся на следующий квест
			_set_current_quest(_get_quest_by_index(_current_quest_index))
		
# Устанавливает текущий квест
func _set_current_quest(quest: quest):
	_current_quest = quest
	
	# Устанавливаем текущий идентификатор квеста
	if _current_quest:
		GlobalVariables.get_main().get_quests().set_current_quest_id(_current_quest.get_id())

# Возвращает квест по идентификатору
func _get_quest_by_index(index: int) -> quest:
	if _quests_data.size() > 0:
		return _quests_data[index] as quest
	else:
		return null

# Мы выходим из этой цепочки только в том случае, если закончились все квесты
func is_completed() -> bool:
	return _current_quest_index == -1
