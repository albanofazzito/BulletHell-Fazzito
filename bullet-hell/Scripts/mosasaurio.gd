extends Node2D

var velocidad=200
var direccion

func _ready():
	direccion=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x=delta*velocidad*direccion
	if global_position.x==50 or global_position.x==1102:
		cambiarDireccion()

func cambiarDireccion():
	direccion=direccion*-1
	print("hola")
