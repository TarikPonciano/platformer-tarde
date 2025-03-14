extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var direction = 0
@onready var animation = $AnimatedSprite2D
var perseguir = false
var jogador = null
var pulinho = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		pulinho = false
	else:
		pulinho = true
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if (perseguir):
		var distancia = (jogador.position - self.position).x
		
		if distancia > 0:
			direction = 1
		elif distancia < 0:
			direction = -1
		
	if direction:
		velocity.x = direction * SPEED
		if pulinho:
			velocity.y = JUMP_VELOCITY
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
		


func _on_detectar_player_body_entered(body: Node2D) -> void:
	if (body.name == "Player Foxy"):
		
		perseguir = true
		jogador = body
		


func _on_detectar_player_body_exited(body: Node2D) -> void:
	if (body.name == "Player Foxy"):
		perseguir = false
		jogador = null
		direction = 0
