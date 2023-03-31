extends Area2D

func _on_quest_area2d_trigger_body_entered(body):
	GlobalVariables.get_main().on_quest_area2d_trigger_body_entered(body, name)
