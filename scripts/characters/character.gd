class_name character extends KinematicBody2D

var _velocity = Vector2()

export var speed = 200

func get_speed() -> float:
	return speed

func move_left(var force: float):
	_velocity.x = -speed * force
	
func move_right(var force: float):
	_velocity.x = speed * force
	
func move_up(var force: float):
	_velocity.y = -speed * force
	
func move_down(var force: float):
	_velocity.y = speed * force

func _move():
	_input_controller()
	move_and_slide(_velocity, Vector2(0, -1))
	_velocity.x = 0
	_velocity.y = 0

func _ready():
	pass

func _physics_process(delta):
	_move()

func _input_controller():
	pass
