extends CharacterBody2D


const SPEED = 100.0
var direction = -1
var can_die = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$FloorChecker.position.x = $Feet.shape.get_size().x * direction

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_wall() or not $FloorChecker.is_colliding() and is_on_floor():
		direction *= -1
		$AnimatedSprite2D.flip_h = not $AnimatedSprite2D.flip_h
	if $Feet !=null:
		$FloorChecker.position.x = $Feet.shape.get_size().x * direction
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	


func _on_sides_checker_body_entered(body):
	if body.is_in_group("player"):
		can_die = false
		Globals.lose_life.emit()
		body.velocity.y = 0
	
		$CoolDownTimer.start()


func _on_top_checker_body_entered(body):
	if body.is_in_group("player"):
		$SidesChecker.queue_free()
		$Feet.queue_free()
		body.velocity.y = -800
		$AnimatedSprite2D.play("squashed")
		#$DeathTimer.start()
		


func _on_death_timer_timeout():
	queue_free()
	


func _on_cool_down_timer_timeout():
	can_die = true
