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
		velocity = direction * DASHSPEED
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("SlowMotion"):
		GameController.slowMotion()
	if event.is_action_pressed("Ataque"):
		atacarInimigo()


var listaInimigos : Array[InimigoBase] = []

func _detectouInimigo(body: Node2D) -> void:
	listaInimigos.append(body as InimigoBase)
	pass # Replace with function body.

func _inimigoSaiu(body: Node2D) -> void:
	listaInimigos.erase(body as InimigoBase)

func atacarInimigo():
	if listaInimigos.is_empty(): 
		print("Não tem ninguém aq")
		return
	
	var alvo : InimigoBase = listaInimigos[0]
	var dist = alvo.global_position.distance_squared_to(global_position)
	var distTemp
	for i in listaInimigos:
		distTemp = i.global_position.distance_squared_to(global_position)
		if distTemp < dist:
			dist = distTemp
			alvo = i
	direction = alvo.global_position - global_position
	direction = direction.normalized()
	dashing = true
	timer_dash.start()
	alvo.tomouHit()

func _on_timer_dash_timeout() -> void:
	dashing = false
	pass # Replace with function body.
