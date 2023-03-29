class_name quest_if_area2d_trigger extends quest_if

# Название узла с Area2D для выполнения true цепочки
export var _true_area2d_name = "true_name"

# Название узла с Area2D для выполнения false цепочки
export var _false_area2d_name = "false_name"

# Триггер для выполнения true цепочки
var _is_true_triggered = false

# Триггер для выполнения false цепочки
var _is_false_triggered = false

# Условие по использованию true цепочки.
# Принимается решение в наследниках.
func is_true_quest() -> bool:
	return _is_true_triggered

# Условие по использованию false цепочки.
# Принимается решение в наследниках.
func is_false_quest() -> bool:
	return _is_false_triggered

# Функция вызывается при столкновении игрока с area2D триггером
func on_player_area2d_triggered(name: String):
	.on_player_area2d_triggered(name)
	
	# Если переключился триггер, мы его не можем ещё раз переключить
	if _is_true_triggered == true or _is_false_triggered == true:
		return
	
	# Сравниваем пересечение с триггером, если нужно, включаем флаги
	if name == _true_area2d_name:
		_is_true_triggered = true
	elif name == _false_area2d_name:
		_is_false_triggered = true
