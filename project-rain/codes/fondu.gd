extends ColorRect

var newAnimation = "rien"
var jeu = "rien"
var messages = []
var phase = 0
var gameInstance = preload("res://project-rain/game.tscn")

func _process(delta: float) -> void:
	if Global.nbClics <= 0 and phase == 0:
		phase = -1
	
	if phase == 1:
		color.a += 4
		if color.a >= 255 :
			$AnimatedSprite2D.animation = "newAnimation"
			if jeu == "stop":
				get_parent().parent().get_node("Game").queue_free()
			if jeu  == "start":
				var gameI = gameInstance.instanciate()
				gameI.name = "Game"
				get_parent().add_child(gameI)
			phase = 2
				
	if phase == 2:
		color.a -= 4
		if color.a <= 255 :
			phase = 0
					
		
