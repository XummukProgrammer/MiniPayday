class_name action_play_level extends action

# Идентификатор уровня
export var _level_id = "level_1"

# Выполнение действия.
func execute():
	GlobalVariables.get_main().get_levels().play(_level_id)
