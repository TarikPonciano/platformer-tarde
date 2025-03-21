extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_iniciar_botao_pressed() -> void:
	if (Game.personagemSelecionado != 0):
		get_tree().change_scene_to_file("res://main.tscn")
	else:
		
		$Panel/IniciarBotao.text = "ESCOLHA UM PERSONAGEM"
		$Panel/IniciarBotao.position.x -= 200


func _on_sair_botao_pressed() -> void:
	get_tree().quit()


func _on_sunny_botao_pressed() -> void:
	Game.personagemSelecionado = 2
	$Panel/Sunny.play("run")
	$Panel/Foxy.play("idle")


func _on_foxy_botao_pressed() -> void:
	Game.personagemSelecionado = 1
	$Panel/Sunny.play("idle")
	$Panel/Foxy.play("run")
