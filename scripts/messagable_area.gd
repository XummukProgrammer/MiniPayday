extends Area2D

# Сообщение, которое будет послано в систему для обработки
export var _message = "message"

# При пересечении с этой областью другого объекта кидаем сообщение
func _on_messagable_area_body_entered(body):
	GlobalVariables.get_main().on_message_sent(self, body, _message)
