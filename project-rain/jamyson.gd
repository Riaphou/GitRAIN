extends CharacterBody2D
var ax=0
var ay=0

func stop():
	$AnimationPlayer.stop()
	ax = 0
	ay = 0
	velocity = Vector2.ZERO
	Global.positionPersonage = global_position

func _ready():
	pass
	
func _physics_process(_delta):
	if ((ax-global_position.x)**2+(ay-global_position.y)**2)**0.5 <10: # Vérifie si le joueur est arrivé, la valeur à la fin est le nb de pixels de distance avec la cible oèu il s'arrête
		stop()
	if Input.is_action_just_pressed("click"):
		Global.nbClics += 1
		ax=get_global_mouse_position().x
		ay=get_global_mouse_position().y
		velocity.x = ax-global_position.x
		velocity.y = ay-global_position.y
		velocity = velocity.normalized() * 150 #Changez la valeur à la fin modifie la vitesse du joueur
	if abs(velocity.y) < abs(velocity.x) and velocity!= Vector2.ZERO :
		if velocity.x > 0:
			$AnimationPlayer.play("right")
		else:
			$AnimationPlayer.play("left")
	elif abs(velocity.x) < abs(velocity.y) and velocity!= Vector2.ZERO :
		if velocity.y < 0:
			$AnimationPlayer.play("up")
		else:
			$AnimationPlayer.play("down")
	move_and_slide()
	if get_slide_collision_count() > 0	:
		stop()
	
	
	 
		
		
		
	
