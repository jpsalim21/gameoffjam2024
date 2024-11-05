extends Node

var estaSlow := false

signal slowMotionSignal(valor : bool)

func slowMotion():
	estaSlow = !estaSlow
	slowMotionSignal.emit(estaSlow)
	if estaSlow:
		InimigoBase.multiplicadorTemporal = 0.2
	else:
		InimigoBase.multiplicadorTemporal = 1
