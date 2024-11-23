extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not GameController.speedRunMode:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = SpeedRunManager.getTime()
