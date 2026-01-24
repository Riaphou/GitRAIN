extends Node2D

var etape = 0

func _ready() -> void:
	$fondu/AnimatedSprite2D.animation = "rien"
	$fondu.visible = false

	

func _process(delta: float) -> void:
		
		
		
	if etape == -1:
		Global.firstRun = false
		$fondu.visible = true
		$fondu.newAnimation = "perdu1"
		$fondu.jeu = "stop"
		$fondu.phase = 1
		$Timer.start()
		etape = -2
	elif etape == -2 and $Timer.is_stopped():
		$fondu.newAnimation = "perdu2"
		$fondu.jeu = "rien"
		$fondu.phase = 1
		$Timer.start()
		etape = -3
	elif etape == -3 and $Timer.is_stopped():
		$fondu.newAnimation = "rien"
		$fondu.jeu = "start"
		$fondu.phase = 1
		etape = 0
		
	elif etape == 1:
		$fondu.visible = true
		$fondu.newAnimation = "victoire"
		$fondu.jeu = "stop"
		$fondu.phase = 1
		$Timer.start()
		etape = 2
		
	elif etape == 2 and $Timer.is_stopped():
		get_tree().quit()
