class_name Player extends KinematicBody2D

var _velocity = Vector2()

export var speed = 200

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

func _ready():
	pass

func _physics_process(delta):
	_move()
