class_name message_condition extends condition

# С кем должно быть пересечение у отправителя
export var _target_name = "player"

# Какой текст должен быть у сообщения
export var _msg_text = "msg_text"

# Было-ли получено нужное сообщение?
var _is_message_success = false

# Возвращает true при успешном выполнении кондишена
func is_success() -> bool:
	return _is_message_success

# Произошла отправка сообщения
func on_message_sent(who: Node2D, body: Node2D, text: String):
	# Если проверка была выполнена успешно, нет смысла проверять ещё раз
	# TODO: Может очищать из списка кондишенов этот кондишен?
	if _is_message_success:
		return
	
	# Сверяем данные, если они равны, то считаем, что кондишен отработал
	if body.name == _target_name and _msg_text == text:
		_is_message_success = true
