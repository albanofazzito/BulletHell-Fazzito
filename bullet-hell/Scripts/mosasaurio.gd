extends Node2D

var velocidad=200
var direccion
var proyectilEscena
var vida=150	
var muerto=false
signal mosaMurio

func _ready():
	proyectilEscena= preload("res://Escenas/DisparoMosa.tscn")
	direccion=-1
	$TimerDisparo.start(randi_range(2,5))

func _process(delta: float) -> void:
	position.x+=delta*velocidad*direccion
	if position.x<=110 or position.x>=1042:
		cambiarDireccion()
	if vida<=0:
		emit_signal("mosaMurio")
		morir()

func morir():
	if muerto==false:
		$Area2D.collision_layer = 0
		$Area2D.collision_mask = 0
		#$MosaMuerte.play()
		$TimerDesaparicion.start()
		$TimerMuerte.start()
		#$GPUParticles2D.emitting=true
		muerto=true

func cambiarDireccion():
	direccion=direccion*-1
	$AnimatedSprite2D.flip_h= !$AnimatedSprite2D.flip_h


func _on_timer_disparo_timeout() -> void:
	velocidad=0
	scale.x=7
	scale.y=7
	position.y+=10
	$AnimatedSprite2D.play("disparar")
	disparar()
	$TimerDisparo.start(randi_range(2,5))


func _on_animated_sprite_2d_animation_finished() -> void:
	scale.x=5
	scale.y=5
	velocidad=200
	position.y-=10
	$AnimatedSprite2D.play("default")

func disparar():
	for i in range (3):
		var disparo=proyectilEscena.instantiate()
		get_parent().add_child(disparo)
		disparo.global_position=global_position
		if i==1:
			disparo.inicializar(deg_to_rad(-90))
		elif i==2:
			disparo.inicializar(deg_to_rad(-45))
		else:
			disparo.inicializar(deg_to_rad(-135)) 


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("DisparoRaptor"):
		area.queue_free()
		vida-=2
		herir()
		$TimerHerido.start()


func _on_timer_herido_timeout() -> void:
	$AnimatedSprite2D.modulate= Color(1,1,1)

func herir():
	$AnimatedSprite2D.modulate= Color(0.973, 0.0, 0.0, 1.0)

func _on_timer_desaparicion_timeout() -> void:
	if muerto:
		$AnimatedSprite2D.visible = !$AnimatedSprite2D.visible
		$TimerHerido.start()
		
func _on_timer_muerte_timeout():
	queue_free()
