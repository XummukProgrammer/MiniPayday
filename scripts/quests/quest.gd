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

# Функция вызывается при столкновении игрока с area2D триггером
func on_player_area2d_triggered(name: String):
	pass

# Функция вызывается при обновлении квеста
func update():
	pass
