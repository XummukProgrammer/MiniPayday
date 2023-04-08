class_name Player extends character

func _input_controller():
	if Input.is_action_pressed("ui_left"):
		move_left(1)
	elif Input.is_action_pressed("ui_right"):
		move_right(1)
	
	if Input.is_action_pressed("ui_up"):
		move_up(1)
	elif Input.is_action_pressed("ui_down"):
		move_down(1)
