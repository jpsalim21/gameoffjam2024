extends CharacterBody2D

const SPEED = 100.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("esquerda", "direita", "cima", "baixo")
	velocity = direction.normalized() * SPEED
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("SlowMotion"):
		GameController.slowMotion()
