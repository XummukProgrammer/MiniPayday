class_name quest_if extends quest

# Загружаемые цепочки квестов
export (Array, Resource) var _quest_if_elements

# Текущий элемент, который прошёл условие
var _current_quest_if_element: quest_if_element

# Произведена ли инициализация элементов
# TODO: Заменить на condition.is_inited() ?
var _is_elements_inited = false

# Функция вызывается при обновлении квеста
func update():
	.update()
	
	# Инициализируем элементы
	if not _is_elements_inited:
		for quest_if_element in _quest_if_elements:
			var data = quest_if_element as quest_if_element
			data.init()
		
		# Текущий квест считается квестом на развилку.
		GlobalVariables.get_main().get_quests().set_current_quest_id(get_id())
		
		_is_elements_inited = true
	
	# Пытаемся найти элемент, который удовлетворяет условие
	if not _current_quest_if_element:
		for quest_if_element in _quest_if_elements:
			var data = quest_if_element as quest_if_element
			if data.get_condition().is_success():
				_current_quest_if_element = data
				# Развилку тоже сохраняем как отдельный квест.
				GlobalVariables.get_main().get_quests().on_quest_completed(data.get_id())
				# Текущий квест не обновляем. Предполагаем что он обновится при первой
				# итерации data.get_quest().update()
				
	# Найденный элемент всегда обновляем
	if _current_quest_if_element:
		_current_quest_if_element.get_quest().update()

# Выполнение цепочки только в том случае, как будет закончена вся текущая цепочка
func is_completed() -> bool:
	if _current_quest_if_element:
		return _current_quest_if_element.get_quest().is_completed()
	return false
