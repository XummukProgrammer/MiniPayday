class_name area_trigger_condition  extends condition

# Название объекта Area
export var _area_name = "area_name"

# Произошёл ли триггер
var _is_triggered = false

# Возвращает true при успешном выполнении кондишена
func is_success() -> bool:
	return _is_triggered

# Вызывается при вхождении игрока в область area
func on_player_area_entered(area_name: String):
	if area_name == _area_name:
		_is_triggered = true
