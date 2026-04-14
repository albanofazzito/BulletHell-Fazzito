extends Node2D


var velocidad= -150
var direccion=1
var spriteAdecuado= null
var tamañoEspina=1

func inicializar(dir,sprite,tamaño):
	direccion=dir
	spriteAdecuado=sprite.texture
	if dir==-1:
		scale.x=-1
	$Area2D.scale.x*=tamaño
	$Area2D.scale.y*=tamaño


func _process(delta: float) -> void:
	position.x+=velocidad*delta *direccion
	$Sprite2D.texture=spriteAdecuado



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Jugador"):
		body.recibirDaño()
