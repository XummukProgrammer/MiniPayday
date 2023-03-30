class_name quest extends Resource

# Идентификатор квеста
export var _id: String

# Кондишен
export (Resource) var _condition

# Возвращает идентификатор квеста
func get_id() -> String:
	return _id
	
# Возвращает кондишен
func get_condition() -> condition:
	return _condition as condition

# Проверяем выполнение квеста.
# В основном определять в наследниках.
func is_completed() -> bool:
	if _condition:
		var is_success = get_condition().is_success()
		if is_success:
			print_debug("Completed Quest: %s!" % get_id())
		return is_success
	return false

# Функция вызывается при обновлении квеста
func update():
	if _condition:
		var condition = get_condition()
		if not condition.is_inited():
			condition.init()
