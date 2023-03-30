class_name condition extends Resource

# Инициализирован ли кондишен
var _is_inited = false

# Возвращает true при успешном выполнении кондишена
func is_success() -> bool:
	return false

# Вызывается при вхождении игрока в область area
func on_player_area_entered(area_name: String):
	pass

# Инициализация
func init():
	GlobalVariables.add_condition(self)
	_is_inited = true
	
# Возвращает инициализирован ли кондишен
func is_inited() -> bool:
	return _is_inited
