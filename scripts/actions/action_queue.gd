class_name action_queue extends action

# Цепочка экшенов
export (Array, Resource) var _actions

# Закончились ли экшены
var _is_actions_ended = false

# Текущий выполняемый экшен.
var _current_action: action

# Индекс выполняемого экшена.
var _current_action_index = -1

# Стартовал ли выполняемый экшен.
var _is_current_action_started = false

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
		# Обновляем, не зависит не от какой логики.
		_current_action.update()
		
		# Если было совершено мгновенное выполнение, сразу переходим к следующему экшену.
		if _current_action.is_force_execute():
			_increment_current_action()
			return
		
		# Если экшен стартовал, то производим с ним действия
		if _is_current_action_started:
			# Пытаемся скипнуть экшен
			if _current_action.is_skipped():
				_skip_current_action()
			# Пытаемся перейти на следующий экшен
			elif _current_action.is_executed():
				_increment_current_action()
		else:
			_is_current_action_started = _current_action.is_started()

# Перейти на новый экшен.
func _increment_current_action():
	# Если все экшены закончились, скипаем инкремент
	if _is_actions_ended:
		return
	
	# Инкрементируем счётчик.
	_current_action_index = _current_action_index + 1
	
	# Очищаем данные
	_is_current_action_started = false
	
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

# Скипаем текущее действие.
func _skip_current_action():
	_increment_current_action()
