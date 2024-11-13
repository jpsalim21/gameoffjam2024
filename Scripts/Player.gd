extends CharacterBody2D
@onready var timer_dash: Timer = $TimerDash

const SPEED := 100.0
const DASHSPEED := 200.0
var dashing := false
var direction : Vector2

func _physics_process(delta: float) -> void:
	if not dashing:
		direction = Input.get_vector("esquerda", "direita", "cima", "baixo")
		velocity = direction.normalized() * SPEED
	else:
		velocity = direction.normalized() * DASHSPEED
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("SlowMotion"):
		GameController.slowMotion()
	if event.is_action_pressed("Ataque"):
		atacarInimigo()

func atacarInimigo():
	dashing = true
	timer_dash.start(0.1)

func _on_timer_dash_timeout() -> void:
	dashing = false
	pass # Replace with function body.
