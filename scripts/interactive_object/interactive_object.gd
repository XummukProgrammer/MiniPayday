class_name interactive_object extends Resource

# Кондишен
export (Resource) var _condition

# Действие
export (Resource) var _action

# Был ли выполнен кондишен
var _is_condition_success = false

# Был ли выполнен экшен
var _is_action_executed = false

# Получить кондишен
func get_condition() -> condition:
	return _condition as condition
	
# Получить действие
func get_action() -> action:
	return _action as action

# Обновление
func update():
	# Объект выполнил свою задачу, не производим никаких действий
	if _is_action_executed:
		return
	
	# Инициализируем кондишен
	var cond = get_condition()
	if not cond.is_inited():
		cond.init()
		
	# Ждём пока кондишен выполнится
	if cond.is_success():
		_is_condition_success = true
		
	# Если кондишен выполнен, выполняем экшен
	if _is_condition_success:
		var act = get_action()
		act.update()
		
		# Если экшен выполнился, то считаем что объект выполнил свою задачу
		if act.is_executed():
			_is_action_executed = true
