class_name enemy extends character

export var _path_to_move_pattern: NodePath

var _current_point = 0
var _start_rotation = 0

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
			
			# Для правильной работы необходимо сомкнуть прямую.
			if _current_point >= move_pattern.curve.get_point_count():
				_current_point = 0
				
			_change_move_pattern_point(_current_point)

func _ready():
	_start_rotation = rotation
	_change_move_pattern_point(_current_point)

func _draw():
	#draw_polygon(
	#	$eye/CollisionPolygon2D.polygon, PoolColorArray([Color(1, 1, 1, 1)])
	#)
	pass

func _on_eye_body_exited(body):
	pass # Replace with function body.

func _is_floats_equal(var a: float, var b: float):
	return abs(a - b) < 1

func _is_vectors_equal(var a: Vector2, var b: Vector2):
	return _is_floats_equal(a.x, b.x) and _is_floats_equal(a.y, b.y)

func _change_move_pattern_point(var point_index: int):
	var move_pattern = get_move_pattern()
	if move_pattern:
		var point = move_pattern.curve.get_point_position(point_index)
		if point:
			var dir = (point - position).normalized()
			rotation = _start_rotation + dir.angle()
