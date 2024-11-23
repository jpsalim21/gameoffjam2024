extends CanvasLayer

@onready var menu_inicial: Control = $MenuInicial
@onready var options: Control = $Options

var fase : String = "res://Cenas/CenaTeste.tscn"

func options_pressed() -> void:
	menu_inicial.visible = false
	options.visible = true

func return_pressed() -> void:
	menu_inicial.visible = true
	options.visible = false

func play_pressed() -> void:
	GameController.changeScene(fase)

func _on_button_mouse_entered() -> void:
	print("Mouse entrou")
	pass # Replace with function body.
