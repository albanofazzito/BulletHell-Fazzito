extends TextureButton


func _input(event):
	if event is InputEventMouseButton:
		print("click detectado")


func _on_pressed():
	AutoLoad.vidas=4
	get_tree().paused= false
	Loading.cambiar_escena("res://Escenas/Juego.tscn")
	
