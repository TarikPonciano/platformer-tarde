extends Node

@export var gemScene:PackedScene
var contador = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Versão aleatoria
#func _on_timer_timeout() -> void:
	#var novaGem = gemScene.instantiate()
	#var random = RandomNumberGenerator.new()
	#var posicaoX = random.randi_range(300,600)
	#var posicaoY = random.randi_range(450,500)
	#novaGem.position = Vector2(posicaoX,posicaoY)
	#add_child(novaGem)

#Versão sequencial
#func _on_timer_timeout() -> void:
	#var pontosDeSpawn = get_node("SpawnPoints").get_children()
	#var novaGem = gemScene.instantiate()
	#var spawnPointEscolhido = pontosDeSpawn[contador]
	#novaGem.position = Vector2(spawnPointEscolhido.position.x,spawnPointEscolhido.position.y)
	#contador = (contador + 1) % pontosDeSpawn.size()
	##if(contador > pontosDeSpawn.size()-1):
		##contador = 0
	#add_child(novaGem)
	
func _on_timer_timeout() -> void:
	var pontosDeSpawn = get_node("SpawnPoints").get_children()
	var novaGem = gemScene.instantiate()
	var random = RandomNumberGenerator.new()
	
	var spawnPointEscolhido = pontosDeSpawn[random.randi_range(0, pontosDeSpawn.size() - 1)]
	
	novaGem.position = Vector2(spawnPointEscolhido.position.x,spawnPointEscolhido.position.y)
	
	add_child(novaGem)
