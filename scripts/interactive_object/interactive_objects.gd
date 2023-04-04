class_name interactive_objects extends Node

# Интерактивные объекты
export (Array, Resource) var _objects

# Обновление
func _process(delta):
	for obj in _objects:
		var data = obj as interactive_object
		data.update()
