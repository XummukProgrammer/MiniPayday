class_name quest_if_element extends Resource

# Квест
export (Resource) var _quest

# Кондишен
export (Resource) var _condition

# Получить квест
func get_quest() -> quest_queue:
	return _quest as quest_queue
	
# Получить кондишен
func get_condition() -> condition:
	return _condition as condition

# Инициализация
func init():
	get_condition().init()
