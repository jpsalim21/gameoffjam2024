extends ColorRect

func _ready() -> void:
	GameController.slowMotionSignal.connect(rodarEfeito)

func rodarEfeito(valor : bool):
	$AnimationPlayer.play("shockWave")
