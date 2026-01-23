extends Node2D



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		Global.nbClics = Global.nbClics+1
		if Global.nbClics == 4:
			$"boîte de dialogue".queue_text("Bonjours les gens\nCool")
