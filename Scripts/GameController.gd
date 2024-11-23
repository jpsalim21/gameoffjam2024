extends Node

#Slow motion
var estaSlow := false
signal slowMotionSignal(valor : bool)
func slowMotion():
	if estaSlow:
		return
	estaSlow = true
	slowMotionSignal.emit(estaSlow)
	InimigoBase.multiplicadorTemporal = 0.2
	await get_tree().create_timer(3).timeout
	InimigoBase.multiplicadorTemporal = 1
	estaSlow = false
	slowMotionSignal.emit(estaSlow)

#Speedrun
var speedRunMode := true

func changeScene(fileName : String):
	await TransicaoDeCena.comecarTransicao()
	await get_tree().change_scene_to_file(fileName)
	TransicaoDeCena.fecharTransicao()
