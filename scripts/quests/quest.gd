class_name quest extends Resource

# Идентификатор квеста
export var _id: String

# Кондишен
export (Resource) var _condition

# Действие при выполнении квеста
export (Resource) var _completed_action

# Отработал ли кондишен
var _is_condition_success = false

# Отработал ли экшен
var _is_action_executed = false

# Возвращает идентификатор квеста
func get_id() -> String:
	return _id
	
# Возвращает кондишен
func get_condition() -> condition:
	return _condition as condition

# Возвращает действие при выполнении квеста
func get_completed_action() -> action:
	if _completed_action:
		return _completed_action as action
	return null

# Проверяем выполнение квеста.
# В основном определять в наследниках.
func is_completed() -> bool:
	return _is_condition_success and _is_action_executed

# Функция вызывается при выполнении квеста
func on_completed():
	print_debug("Completed Quest: %s!" % get_id())
	GlobalVariables.get_main().get_quests().on_quest_completed(self)

# Функция вызывается при обновлении квеста
func update():
	if _condition:
		var condition = get_condition()
		
		# Первоначальная инициализация кондишена
		if not condition.is_inited():
			condition.init()
			
		# Проверяем выполнение кондишена
		if not _is_condition_success:
			_is_condition_success = condition.is_success()
	else:
		_is_condition_success = true
		
	# Если кондишен выполнился, вызываем экшен
	if _is_condition_success:
		if _completed_action:
			# Обновляем экшен.
			# TODO: Таким образом мы не вызовим экшен вне action_queue, нужно
			# доработать решение.
			var act = get_completed_action()
			act.update()
	else:
		_is_action_executed = true
