extends Node2D


var direccion= Vector2(0, 0) 
var velocidad = 200

func _process(delta):
	position+= velocidad*delta*direccion
	
func inicializar(dir):
	direccion=dir
	if direccion.x > 0:
		$Sprite2D.flip_h= true
	else:
		$Sprite2D.flip_h= true
	$Sprite2D.rotation=direccion.angle()
	


func _on_area_2d_body_entered(body):
	body.recibirDaño()
