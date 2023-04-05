class_name level_scene extends Node

# Путь до игрока
export var _player_path: NodePath

# Игрок
var _player: Node

# Получить игрока
func get_player() -> Node:
	return _player
	
# Добавить на главную сцену
func add_to_main_scene():
	GlobalVariables.get_main().get_node("levels").add_child(self)

# Удалить с главной сцены
func remove_from_main_scene():
	# Убираем камеру с игрока
	# TODO: Костыль
	GlobalVariables.get_main().get_camera().set_target_object(null)
	
	_player = null
	
	GlobalVariables.get_main().get_node("levels").remove_child(self)

func _ready():
	_player = get_node(_player_path)
	
	# Устанавливаем камеру на игрока
	# TODO: Костыль, устанавливать с помощью квестов
	GlobalVariables.get_main().get_camera().set_target_object(get_player())
