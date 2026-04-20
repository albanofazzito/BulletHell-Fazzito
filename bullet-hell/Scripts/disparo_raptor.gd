extends Node2D

var velocidad= 150
var direccion=1


func _process(delta):
	var dir = (get_global_mouse_position() - global_position).normalized()
	position.x+=velocidad*delta *direccion
