class_name quest_if_area2d_trigger extends quest_if

# Названия узлов Area2D.
# При пересечении с определённым его индекс из этого массива
# будет сопаставлен с возможными цепочками и возвращён в get_current_index_id()
export var _conditions: Array

# Индекс текущей цепочки.
var _current_index = -1

# Возвращает индекс цепочки по условию
func get_current_index() -> int:
	return _current_index

# Функция вызывается при столкновении игрока с area2D триггером
func on_player_area2d_triggered(name: String):
	# Вызываем on_player_area2d_triggered(name) в дочерних цепочках
	.on_player_area2d_triggered(name)
	
	# Если текущий индекс уже найден, его нельзя поменять
	if _current_index != -1:
		return
	
	# Ищем нужный кондишен, забираем его индекс и записываем в _current_index
	var index = 0
	for condition in _conditions:
		if condition == name:
			_current_index = index
			return
		index = index + 1
