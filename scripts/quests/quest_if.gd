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
		_is_elements_inited = true
	
	# Пытаемся найти элемент, который удовлетворяет условие
	if not _current_quest_if_element:
		for quest_if_element in _quest_if_elements:
			var data = quest_if_element as quest_if_element
			if data.get_condition().is_success():
				_current_quest_if_element = data
				
	# Найденный элемент всегда обновляем
	if _current_quest_if_element:
		_current_quest_if_element.get_quest().update()
