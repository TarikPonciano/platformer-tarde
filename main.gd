extends Node2D

@export var foxyScene:PackedScene
@export var sunnyScene:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var novoJogador = null
	
	if (Game.personagemSelecionado == 1):
		novoJogador = foxyScene.instantiate()
	elif (Game.personagemSelecionado == 2):
		novoJogador = sunnyScene.instantiate()
	
	novoJogador.position = Vector2(300,300)
	add_child(novoJogador)
