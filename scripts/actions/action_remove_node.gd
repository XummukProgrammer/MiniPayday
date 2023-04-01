class_name action_remove_node extends action

# Название ноды (Относительно main)
export var _node_name = "node_name"

# Удаляем ноду.
func execute():
	var node = GlobalVariables.get_main().get_node(_node_name)
	if node:
		node.get_parent().remove_child(node)
