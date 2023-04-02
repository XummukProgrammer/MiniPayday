extends Node2D

export var is_open = false

func _ready():
	if is_open:
		$animation.play("open_gate")
	

func open():
	if !is_open:
		is_open = true;
		$animation.play("open_gate")

func close():
	if is_open:
		is_open = false;
		$animation.play_backwards("open_gate")
