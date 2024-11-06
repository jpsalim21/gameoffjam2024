extends Node

func _ready() -> void:
	if GameController.speedRunMode:
		SpeedRunManager.set_process(true)
