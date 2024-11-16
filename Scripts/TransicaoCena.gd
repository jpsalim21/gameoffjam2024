extends CanvasLayer
@onready var animation: AnimationPlayer = $AnimationPlayer

func comecarTransicao():
	animation.play("Comeca")
	await animation.animation_finished
	return

func fecharTransicao():
	animation.play("Termina")
