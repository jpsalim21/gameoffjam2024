extends InimigoBase

const SPEED = 600.0

func _ready() -> void:
	multiplicadorTemporal = 0.5

func _physics_process(delta: float) -> void:
	# Teste de movimentação
	velocity = Vector2.RIGHT * SPEED * (delta * multiplicadorTemporal)
	move_and_slide()
