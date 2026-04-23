extends Control






func _on_pressed():
	get_tree().paused= false
	Loading.cambiar_escena("res://Escenas/MenuPrincipal.tscn")
