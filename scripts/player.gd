extends KinematicBody2D

var _camera: Camera2D
var _velocity = Vector2()

export var obj : NodePath
export var speed = 200
export var camera_move_speed = 0.1

func set_camera(camera):
	_camera = camera
	_camera.position = position

func _move():
	if Input.is_action_pressed("ui_left"):
		_velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		_velocity.x = speed
	else:
		_velocity.x = 0
	
	if Input.is_action_pressed("ui_up"):
		_velocity.y = -speed
	elif Input.is_action_pressed("ui_down"):
		_velocity.y = speed
	else:
		_velocity.y = 0

	move_and_slide(_velocity, Vector2(0, -1))

func _update_camera():
	if _camera:
		_camera.position = lerp(_camera.position, position, camera_move_speed)
		_camera.position.x = ceil(_camera.position.x)
		_camera.position.y = ceil(_camera.position.y)

func _ready():
	pass

func _physics_process(delta):
	_move()
	_update_camera()
