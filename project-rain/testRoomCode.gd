extends Node2D



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		Global.nbClics = Global.nbClics+1
		if Global.nbClics > 4:
			pass
			#$"boîte de dialogue".QUEUE_TEXT("Bonjours les gens\nCool")
			
