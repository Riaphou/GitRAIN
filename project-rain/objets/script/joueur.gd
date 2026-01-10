extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = 0.0
	if Input.is_action_pressed("left"):
		direction += -1.0
	if Input.is_action_pressed("right"):
		direction += 1.0
		
	if direction != 0.0:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("idle")
	
	move_and_slide()
	
	if Input.is_action_just_pressed("left"):
		$AnimatedSprite2D.flip_h = true
		
	elif Input.is_action_just_pressed("right"):
		$AnimatedSprite2D.flip_h = false
	
