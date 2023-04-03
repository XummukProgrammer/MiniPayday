class_name action_queue extends action

# Цепочка экшенов
export (Array, Resource) var _actions

# Закончились ли экшены
var _is_actions_ended = false

# Текущий выполняемый экшен.
var _current_action: action

# Индекс выполняемого экшена.
var _current_action_index = -1

# Было ли совершено действие.
func is_executed() -> bool:
	return _is_actions_ended

# Обновление экшена.
func update():
	# Если все экшены закончились, скипаем обновление
	if _is_actions_ended:
		return
	
	# Находим текущий экшен
	if not _current_action:
		# Переходим к первому действию
		_increment_current_action()
	
	# Обновляем текущий экшен (Если он есть)
	if _current_action:
		_current_action.update()
		
		# Пытаемся перейти на следующий экшен
		if _current_action.is_executed():
			# Переходим к следующему действию
			_increment_current_action()

# Перейти на новый экшен.
func _increment_current_action():
	# Если все экшены закончились, скипаем инкремент
	if _is_actions_ended:
		return
	
	# Инкрементируем счётчик.
	_current_action_index = _current_action_index + 1
	
	# Проверяем, не закончились ли действия.
	# Если закончились, то выходим из метода и очищаем данные.
	if _current_action_index >= _actions.size():
		_is_actions_ended = true
		_current_action = null
		return
	
	# Устанавливаем текущий экшен.
	_current_action = _actions[_current_action_index] as action
	
	# Прям тут запускаем экшен.
	_execute_current_action()

# Запускаем текущее действие.
func _execute_current_action():
	if _current_action:
		_current_action.execute()
