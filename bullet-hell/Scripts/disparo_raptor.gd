extends Node2D

var velocidad= 250
var direccion= Vector2.ZERO
func iniciar(dir):
	direccion=dir

func _process(delta):
	position.x+=velocidad*delta *direccion.x
	position.y+=velocidad*delta *direccion.y
