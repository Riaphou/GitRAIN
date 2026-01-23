extends Node
var nbclics = 0

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("click"):
		nbclics += 1
	
