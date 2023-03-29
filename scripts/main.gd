extends Node2D

export var camera_path: NodePath
export var player_path: NodePath
export var quests_path: NodePath
export (Array, NodePath) var quests_area2d_triggers

onready var camera = get_node(camera_path)
onready var player = get_node(player_path)
onready var quests = get_node(quests_path)

func _ready():
	camera.set_target_object(player)
	
	for quests_area2d_trigger in quests_area2d_triggers:
		var area2D = get_node(quests_area2d_trigger) as Area2D
		area2D.connect("body_entered", self, "_on_quest_area2d_trigger_body_entered", [ area2D.name ])

func _on_quest_area2d_trigger_body_entered(body, name):
	if player.name == body.name:
		quests.on_player_area2d_triggered(name)
