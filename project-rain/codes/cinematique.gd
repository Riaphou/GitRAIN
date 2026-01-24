extends Node2D


var victoire = true
var etape = "fondu"
var canSkip = false

func _ready() -> void:
	$ColorRect.color.a = 0
	if Global.nbClics < 0 :
		victoire = false

func _process(delta: float) -> void:
	if etape == "fondu":
		$ColorRect.color.a += 2
		if $ColorRect.color.a >= 255:
			etape = "switchCine"
			$Timer.wait_time = 10
	
	elif etape == "switchCine":
		

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if 
