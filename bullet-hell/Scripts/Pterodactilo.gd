extends Node2D


var direccion
var velocidad=200
var meteoritoEscena

func _ready():
	meteoritoEscena= preload("res://Escenas/Meteorito.tscn")

func inicializar(posicion):
	$TimerMeteorito.start(randf_range(0.5,4))
	if posicion.x==0:
		direccion=1
		$Area2D/AnimatedSprite2D.flip_h=true
	else:
		direccion=-1
		$Area2D/AnimatedSprite2D.flip_h=false

func _process(delta: float) -> void:
	position.x+=delta*direccion*velocidad

func _on_timer_meteorito_timeout() -> void:
		var meteorito= meteoritoEscena.instantiate()
		meteorito.global_position= Vector2(global_position)
		get_parent().add_child(meteorito)
		meteorito.global_position=global_position
		meteorito.inicializar(Vector2(direccion,1).normalized(),1,direccion)
		$Area2D/AnimatedSprite2D.play("default")
	
