extends Camera2D

export var camera_move_speed = 0.1

var _target_object: Node2D

func set_target_object(target: Node2D):
	_target_object = target
	position = _target_object.position

func _physics_process(delta):
	if _target_object:
		position = lerp(position, _target_object.position, camera_move_speed)
		position.x = ceil(position.x)
		position.y = ceil(position.y)
