extends Control


func _on_texture_button_pressed() -> void:
	Loading.cambiar_escena("res://Escenas/SeleccionNiveles.tscn")
	AutoLoad.vidas=3
