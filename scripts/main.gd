extends Node2D

onready var camera = $camera
onready var player = $sort_objects/player

func _ready():
	player.set_camera(camera)
