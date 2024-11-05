extends ColorRect

func _ready() -> void:
	GameController.slowMotionSignal.connect(rodarEfeito)

func rodarEfeito():
	$AnimationPlayer.play("shockWave")
