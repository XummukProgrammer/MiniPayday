extends Node2D

export var camera_path: NodePath
export var player_path: NodePath

onready var camera = get_node(camera_path)
onready var player = get_node(player_path)

func _ready():
	camera.set_target_object(player)
