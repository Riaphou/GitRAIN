extends ColorRect

func _ready():
	var col = color
	col.a = 0
	color = col
	for _i in range(100):
		col.a += 0.01
		color = col
		await get_tree().create_timer(0.03).timeout

func _process(_delta):
	pass
		
		
		
	
