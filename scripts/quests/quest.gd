class_name quest extends Resource

# Идентификатор квеста
export var _id: String

# Возвращает идентификатор квеста
func get_id() -> String:
	return _id

# Проверяем выполнение квеста.
# В основном определять в наследниках.
func is_completed() -> bool:
	return false
