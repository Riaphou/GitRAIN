extends ColorRect
 
func _ready():
	var col = color
	col.a = 0
	color = col
	var listemots=["mot", "lettres","autremot"]	 #Ici sont les indices affichés à la fin du jeu, tu peux les modifier, Arthur
	$dialogue.layer = 2 #Les layers ne marchent pas, à voir samedi ( textbox au dessus de fondu)
	$dialogue.queue_text(listemots[randi() % listemots.size()]) 
	await get_tree().create_timer(3).timeout
	for _i in range(100):
		col.a += 0.01
		color = col
		await get_tree().create_timer(0.15).timeout

func _process(_delta):
	pass
		
		
		
	
