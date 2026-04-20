extends Node2D

var velocidad= 150
var direccion=1


func _process(delta):
	position.x+=velocidad*delta *direccion
