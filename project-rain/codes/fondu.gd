extends ColorRect

var newAnimation = "rien"
var jeu = "rien"
var messages = []
var fhase = 0

func _process(delta: float) -> void:
	if phase = 1:
		color.a += 2
			if color.a >= 255:
				pass
				$AnimatedSprite2D.animation = "newAnimation"
				if jeu == "stop":
					get_parent().get_node("Game").queue_free()
				if jeu  == "start":
					get_parent
		
