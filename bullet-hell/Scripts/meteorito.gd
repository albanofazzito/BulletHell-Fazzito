extends Node2D


var direccion=Vector2.ZERO
var velocidad=200
func inicializar(dir):
	direccion=dir
	if dir.x>0:
		$Area2D/AnimatedSprite2D.flip_h=true
	
func _process(delta: float) -> void:
	position+=delta*velocidad*direccion
	


func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		body.recibirDaño()
