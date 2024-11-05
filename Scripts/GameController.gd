extends Node

var estaSlow := false

signal slowMotionSignal

func slowMotion():
	estaSlow = !estaSlow
	slowMotionSignal.emit()
	if estaSlow:
		InimigoBase.multiplicadorTemporal = 0.5
	else:
		InimigoBase.multiplicadorTemporal = 1
