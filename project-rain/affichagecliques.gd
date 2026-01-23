extends Node2D

func _ready() -> void:
	$unitees.frame = Global.nbClics %10
	$dizaines.frame = Global.nbClics /10

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		$unitees.frame = Global.nbClics %10
		$dizaines.frame = Global.nbClics /10
