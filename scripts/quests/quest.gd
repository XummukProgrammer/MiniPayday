class_name quest extends Resource

# Идентификатор квеста
export var _id: String

# Кондишен
export (Resource) var _condition

# Действие при выполнении квеста
export (Resource) var _completed_action

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
	if _condition:
		return get_condition().is_success()
	return false

# Функция вызывается при выполнении квеста
func on_completed():
	print_debug("Completed Quest: %s!" % get_id())
	GlobalVariables.get_main().get_quests().on_quest_completed(self)
	
	# Выполняем действие, обходя все возможные кондишены при выполнении квеста.
	var act = get_completed_action()
	if act:
		act.execute()

# Функция вызывается при обновлении квеста
func update():
	if _condition:
		var condition = get_condition()
		if not condition.is_inited():
			condition.init()
