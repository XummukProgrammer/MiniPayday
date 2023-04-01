extends Area2D

export var _message = "message"

func _on_messagable_area_body_entered(body):
	GlobalVariables.get_main().on_message_sent(self, body, _message)
