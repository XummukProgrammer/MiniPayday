extends Area2D

# TODO: Следует объект удалять в том случае, если он связан с квестом,
# т.к. в нём заложена не только область столкновения, но и UI

# Объект, при пересечении с которым будет показан/убран хинт
var _hint_trigger_object_name = "player"

# Объект хинта (Label)
onready var _hint = $Hint

# Имя input action, после активации которого будет выпущено сообщение
export var _input_action_name = "ui_accept"

# Название клавиши.
# TODO: Принимать название исходя из контекста игровой платформы.
export var _keyboard_name = "Enter"

# Сообщение, которое будет послано в систему для обработки
export var _message = "message"

# Показываем хинт
func _on_messagable_input_control_body_entered(body):
	if body.name == _hint_trigger_object_name:
		_hint.visible = true

# Скрываем хинт
func _on_messagable_input_control_body_exited(body):
	if body.name == _hint_trigger_object_name:
		_hint.visible = false

# Появление объекта
func _ready():
	# Скрываем хинт при старте
	_hint.visible = false
	
	# Устанавливаем текст хинта
	_hint.text = "Press %s!" % _keyboard_name

# Обновление объекта
func _process(delta):
	# Отправить сообщение можем только если хинт активный и была нажата клавиша
	if _hint.visible and Input.is_action_pressed(_input_action_name):
		# Кидаем сообщение
		GlobalVariables.get_main().on_message_sent(self, null, _message)
