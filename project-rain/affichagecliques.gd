extends Node2D

func _ready() -> void:
	Global.restart()
	$unitees.frame = Global.nbClics %10
	$dizaines.frame = (Global.nbClics %100) /10
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		Global.nbClics -= 1
		#condition de loose
		if Global.nbClics <= 0:
			var ETP = get_parent().get_parent().get_parent().get_node("cinematique")
			if ETP.etape == 0:
				ETP.etape = -1
		
		$unitees.frame = Global.nbClics %10
		$dizaines.frame = (Global.nbClics %100) /10
