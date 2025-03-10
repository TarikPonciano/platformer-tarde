extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var pulo_duplo = true
@onready var animacao = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		if Input.is_action_just_pressed("ui_accept") and pulo_duplo:
			velocity.y = JUMP_VELOCITY*(0.75)
			pulo_duplo = false
			
		if Input.is_action_pressed("ui_accept"):
			velocity += (get_gravity()*0.8) * delta
		else:
			velocity += get_gravity() * delta
			
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		pulo_duplo = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	atualizar_animacao()

	move_and_slide()
	

	
func atualizar_animacao():
	if velocity.x > 0:
		animacao.flip_h = false
	else:
		animacao.flip_h = true
	
	if velocity.y < 0:
		animacao.play("jump")
	elif velocity.y > 0:
		animacao.play("fall")
	elif velocity.x != 0:
		animacao.play("run")
	else:
		animacao.play("idle")
