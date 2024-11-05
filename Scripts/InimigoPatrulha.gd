extends InimigoBase

const SPEED = 50.0

@export var pontosPatrulha : Array[Node2D] = []

var ptsPatrulha : PackedVector2Array = []

var index : int = 0
var direcao

func _ready() -> void:
	multiplicadorTemporal = 1
	for ponto in pontosPatrulha:
		ptsPatrulha.append(ponto.global_position)
	direcao = pontosPatrulha[index].global_position - global_position
	direcao = direcao.normalized()

func _physics_process(delta: float) -> void:
	velocity = direcao * SPEED * (multiplicadorTemporal)
	if(global_position.distance_squared_to(ptsPatrulha[index]) < 10):
		proxPonto()
	move_and_slide()

func proxPonto():
	index = (index + 1) % ptsPatrulha.size()
	direcao = ptsPatrulha[index] - global_position
	direcao = direcao.normalized()
