extends InimigoBase

const SPEED = 100.0

func _ready() -> void:
	multiplicadorTemporal = 1

func _physics_process(delta: float) -> void:
	# Teste de movimentação
	velocity = Vector2.RIGHT * SPEED * (multiplicadorTemporal)
	move_and_slide()
