class_name enemy extends character

var _start_position: Vector2
onready var _path = $Path2D

var _current_point = 0
var _time = 0

func _physics_process(delta):
	_time = _time + delta
	
	if _time < 0.001:
		return
		
	_time = 0
	
	var points = _path.curve.get_baked_points()
	var point = points[_current_point]
	position = _start_position + point
	var cur_pos = position
	_current_point = _current_point + 1
	
	if _current_point >= points.size():
		_current_point = 0

func _ready():
	_start_position = position
