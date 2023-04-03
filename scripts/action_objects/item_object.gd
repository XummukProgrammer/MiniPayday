extends Area2D

tool

export var _sprite : Texture
export var _item_resource : Resource

var _object = null

func _ready():
	if _sprite:
		$Sprite.texture = _sprite
	

func _on_item_object_body_entered(body):
	if body is Player:
		_object = body


func _on_item_object_body_exited(body):
	if body == _object:
		_object = null
		
func _process(delta):
	if _object and Input.is_action_pressed("ui_accept") and _item_resource:
		InventoryManager.add_item(_item_resource)
		queue_free()
