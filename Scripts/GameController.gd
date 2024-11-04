extends Node

var estaSlow := false

func slowMotion():
	estaSlow = !estaSlow
	if estaSlow:
		InimigoBase.multiplicadorTemporal = 0.5
	else:
		InimigoBase.multiplicadorTemporal = 1
