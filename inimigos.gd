extends Node

@export var frogScene:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var novoSapo = frogScene.instantiate()
	
	var pontosDeSpawn = get_node("SpawnPoints").get_children()
	var random = RandomNumberGenerator.new()
	var spawnSelecionado = pontosDeSpawn[random.randi_range(0, pontosDeSpawn.size() - 1)]
	
	novoSapo.position = Vector2(spawnSelecionado.position.x, spawnSelecionado.position.y)
	
	add_child(novoSapo)
	
	
	
