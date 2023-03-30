class_name ItemResource extends Resource

export var _name : String
export var _title : String
export (String, MULTILINE) var _description
export var _cost : int
export var _icon : Texture
export var _sprite : Texture

func get_name():
	return _name
