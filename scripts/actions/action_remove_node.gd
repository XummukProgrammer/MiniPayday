class_name action_remove_node extends action

# Путь ноды (Относительно main)
export var _node_path: NodePath

# Удаляем ноду.
func execute():
	var node = GlobalVariables.get_main().get_current_level_scene().get_node(_node_path)
	if node:
		node.get_parent().remove_child(node)
