extends Node2D


var direccion
var velocidad=200
var meteoritoEscena
var muerto=false

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
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("DisparoRaptor"):
		area.queue_free()
		$Area2D.collision_layer = 0
		$Area2D.collision_mask = 0
		muerto=true
		$TimerHerido.start()
		$TimerMuerte.start()


func _on_timer_herido_timeout() -> void:
	if muerto:
		$Area2D/AnimatedSprite2D.visible = !$Area2D/AnimatedSprite2D.visible
		$TimerHerido.start()


func _on_timer_muerte_timeout() -> void:
	queue_free()
