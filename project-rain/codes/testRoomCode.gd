extends Node2D



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		Global.nbClics = Global.nbClics-1
		if Global.nbClics == 4:
			$dialogue.queue_text("Je ne veux pas qu'on m'invite à cette fête,")
			$dialogue.queue_text("je ne doit pas remplir mon quota de cliques")
