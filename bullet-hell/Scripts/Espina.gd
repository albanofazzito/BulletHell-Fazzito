extends Node2D


var velocidad= 100
var direccion=1
var spriteAdecuado=$Sprite2D.texture

func inicializar(dir,sprite):
	direccion=dir
	spriteAdecuado=sprite


func _process(delta: float) -> void:
	position.x+=velocidad*delta *direccion
	$Sprite2D.texture=spriteAdecuado
