extends Node2D


var direccion=Vector2.ZERO
var velocidad=200
func inicializar(dir,escala,lugar):
	direccion=dir
	scale.x=escala
	scale.y=escala
	if lugar==1:
		$Area2D/AnimatedSprite2D.flip_h=true
	else:
		$Area2D/AnimatedSprite2D.flip_h=false
	
func _process(delta: float) -> void:
	position+=delta*velocidad*direccion
	


func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		body.recibirDaño()
