extends Node2D


var velocidad=300
var direccion
func inicializar(ang):
	$Area2D/ProyectilMosa.rotation=ang
	direccion= Vector2.from_angle(ang)
	
func _process(delta: float) -> void:
	position+= velocidad*delta*direccion

func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		body.recibirDaño()
