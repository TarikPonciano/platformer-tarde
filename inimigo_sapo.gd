extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction = -1
@onready var animation = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	atualizar_animacao()
	move_and_slide()

func atualizar_animacao():
	if (direction == -1):
		animation.flip_h = false
	elif (direction == 1):
		animation.flip_h = true
	
	if (velocity.x != 0):
		animation.play("jump")
	else:
		animation.play("idle")
		
