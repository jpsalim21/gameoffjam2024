extends Node

var tempo : float
const formatacao := "%02d : %02d : %02d"

func _ready() -> void:
	#set_process(false)
	tempo = 0

func _process(delta: float) -> void:
	tempo += delta

func getTime() -> String:
	var msec := fmod(tempo, 1) * 1000
	var sec := fmod(tempo, 60)
	var min := tempo / 60
	var retorno := formatacao % [min, sec, msec]
	return retorno
