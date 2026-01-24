extends ColorRect

var newAnimation = "rien"
var jeu = "rien"
var messages = []
var phase = 0
var gameInstance = preload("res://project-rain/game.tscn")

func _process(delta: float) -> void:
	if phase == 1:
		color.a += 0.01
		if color.a >= 1.0 :
			$AnimatedSprite2D.animation = newAnimation
			if jeu == "stop":
				get_parent().get_parent().get_node("Game").queue_free()
			if jeu  == "start":
				Global.restart()
				var gameI = gameInstance.instantiate()
				gameI.name = "Game"
				get_parent().get_parent().add_child(gameI)
				visible = false
			phase = 2
				
	elif phase == 2:
		color.a -= 0.01
		if color.a <= 0.0 :
			phase = 0
				
