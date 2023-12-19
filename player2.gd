extends Node2D


const SPEED = 300.0
const JUMP_VELOCITY = -900.0

var gravity = 1200


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		$AnimatedSprite2D.play("walk")
		velocity.x = direction * SPEED
		if direction > 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false	
	else:
		if is_on_floor():
			#this will stop the player from moving left or right if it is on the floor and not pressing any keys
			velocity.x = move_toward(velocity.x, 0, SPEED)
			$AnimatedSprite2D.play("idle")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED * 0.03)
	if not is_on_floor():
		$AnimatedSprite2D.play("jump")

	move_and_slide()
