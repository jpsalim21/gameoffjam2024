extends Node

@export var player : CharacterBody2D
@export var tempo : float = 0.1

var listaSprites : Array[Node2D] = []
var timer : Timer
var index : int = 0

func _ready() -> void:
	listaSprites.append_array(get_children())
	timer = Timer.new()
	timer.autostart = false
	timer.wait_time = tempo
	timer.one_shot = true
	timer.stop()
	add_child(timer)
	for s in listaSprites:
		s.visible = false
	timer.timeout.connect(proxSprite)
	GameController.slowMotionSignal.connect(slowMotion)

func slowMotion(valor : bool):
	if valor:
		proxSprite()
	else:
		timer.stop()
		for sprite in listaSprites:
			sprite.visible = false

func proxSprite():
	listaSprites[index].global_position = player.global_position
	listaSprites[index].visible = true
	index = (index + 1) % listaSprites.size()
	timer.start()
