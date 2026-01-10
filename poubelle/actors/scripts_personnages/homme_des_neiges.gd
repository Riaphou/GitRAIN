extends Node2D


var me
func _ready() -> void:
	me = $"."
	
func _process(delta: float) -> void:
	me.position.x = me.position.x+3
	me.get_node("AnimatedSprite2D").play()
