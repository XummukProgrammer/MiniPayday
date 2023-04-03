class_name action_gates extends action

enum Action {OPEN, CLOSE}

# Название ноды (Относительно main)
export var _node_name : NodePath
export (int, "OPEN", "CLOSE") var _action

# Удаляем ноду.
func execute():
	var path = String(_node_name).replace("../", "")
	var node = GlobalVariables.get_main().get_node(path)
	print(node)
	if node:
		if _action == 0:
			node.open()
		if _action == 1:
			node.close()
