class_name condition extends Resource

# Инициализирован ли кондишен
var _is_inited = false

# Возвращает true при успешном выполнении кондишена
func is_success() -> bool:
	return false

# Произошла отправка сообщения
func on_message_sent(who: Node2D, body: Node2D, text: String):
	pass

# Инициализация
func init():
	GlobalVariables.add_condition(self)
	_is_inited = true
	
# Возвращает инициализирован ли кондишен
func is_inited() -> bool:
	return _is_inited
