extends Node2D

var list = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	list.append($decor/Plante2X)
	list.append($"decor/JusD'orangeX")
	list.append($decor/Ordinateur3X)
	list.append($decor/Ordinateur6X)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in range(len(list)):
		if list[i].global_position.y > Global.positionPersonage.y:
			list[i].z_index = 1
		else:
			list[i].z_index = -1
