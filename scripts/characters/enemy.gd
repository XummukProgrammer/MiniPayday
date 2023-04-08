class_name enemy extends character

export var _path_to_move_pattern: NodePath

var _current_point = 0

func get_move_pattern() -> Path2D:
	return get_node(_path_to_move_pattern) as Path2D

func _physics_process(delta):
	var move_pattern = get_move_pattern()
	if move_pattern:
		var point = move_pattern.curve.get_point_position(_current_point)
		var dir = (point - position).normalized()
		position = position + dir * delta * get_speed()
		
		if _is_vectors_equal(position, point):
			_current_point = _current_point + 1
			
			if _current_point >= move_pattern.curve.get_point_count():
				_current_point = 0

func _is_floats_equal(var a: float, var b: float):
	return abs(a - b) < 1

func _is_vectors_equal(var a: Vector2, var b: Vector2):
	return _is_floats_equal(a.x, b.x) and _is_floats_equal(a.y, b.y)
