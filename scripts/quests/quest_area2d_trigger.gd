class_name quest_area2d_trigger extends quest

# Название узла с Area2D
export var _area2d_name = "name"

# Произошёл ли триггер
var _is_triggered = false

# Проверяем выполнение квеста.
func is_completed() -> bool:
	return _is_triggered

# Функция вызывается при столкновении игрока с area2D триггером
func on_player_area2d_triggered(name: String):
	if _area2d_name == name:
		_is_triggered = true
