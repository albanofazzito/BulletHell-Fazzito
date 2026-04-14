extends Node2D
var escenaEspina= preload("res://Escenas/Espina.tscn")
func _ready():
	_on_animated_sprite_2d_frame_changed()
	$TimerDisparoArriba.start(randf_range(3,6))
	$TimerDisparoMedio.start(randf_range(4,7))
	$TimerDisparoAbajo.start(randf_range(3,6))

func _on_animated_sprite_2d_frame_changed():
	if $AnimatedSprite2D.frame==0 :
		$Area2D/ColaIzquierda.disabled=false
	else:
		$Area2D/ColaIzquierda.disabled=true
	if $AnimatedSprite2D.frame==1 or $AnimatedSprite2D.frame==11:
		$Area2D/ColaSemiIzquierda.disabled=false
	else:
		$Area2D/ColaSemiIzquierda.disabled=true
	if $AnimatedSprite2D.frame==2 or $AnimatedSprite2D.frame==10:
		$Area2D/ColaCasiIzquierda.disabled=false
	else:
		$Area2D/ColaCasiIzquierda.disabled=true
	if $AnimatedSprite2D.frame==3 or $AnimatedSprite2D.frame==9:
		$Area2D/ColaMedio.disabled=false
	else:
		$Area2D/ColaMedio.disabled=true
	if $AnimatedSprite2D.frame==4 or $AnimatedSprite2D.frame==8:
		$Area2D/ColaCasiDerecha.disabled=false
	else:
		$Area2D/ColaCasiDerecha.disabled=true
	if $AnimatedSprite2D.frame==5 or $AnimatedSprite2D.frame==7:
		$Area2D/ColaSemiDerecha.disabled=false
	else:
		$Area2D/ColaSemiDerecha.disabled=true
	if $AnimatedSprite2D.frame==6:
		$Area2D/ColaDerecha.disabled=false
	else:
		$Area2D/ColaDerecha.disabled=true
	


func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		body.recibirDaño()


	



func _on_timer_disparo_medio_timeout() -> void:
	var espina=escenaEspina.instantiate()
	get_parent().add_child(espina)
	espina.global_position= $Area2D/StegoEspinaCentral.global_position

	if global_position.x<500:
		espina.global_position.x+= 100
		espina.inicializar(-1,$EspinaMedio,1)
	else:
		espina.global_position.x-= 100
		espina.inicializar(1,$EspinaMedio,1)
	$EspinaMedio.visible=false
	$ReponerEspinaMedio.start(1)
	
func _on_timer_disparo_arriba_timeout() -> void:
	var espina=escenaEspina.instantiate()
	get_parent().add_child(espina)
	espina.global_position= $Area2D/StegoEspinaAlta.global_position

	if global_position.x<500:
		espina.global_position.x+= 100
		espina.inicializar(-1,$EspinaSuperior,0.8)
	else:
		espina.global_position.x-= 100
		espina.inicializar(1,$EspinaSuperior,0.8)
	$EspinaSuperior.visible=false
	$ReponerEspinaArriba.start(1)

func _on_timer_disparo_abajo_timeout() -> void:
	var espina=escenaEspina.instantiate()
	get_parent().add_child(espina)
	espina.global_position= $Area2D/StegoEspinaBaja.global_position

	if global_position.x<500:
		espina.global_position.x+= 100
		espina.inicializar(-1,$EspinaInferior,0.8)
	else:
		espina.global_position.x-= 100
		espina.inicializar(1,$EspinaInferior,0.8)
	$EspinaInferior.visible=false
	$ReponerEspinaAbajo.start(1)


func _on_reponer_espina_medio_timeout() -> void:
	$EspinaMedio.visible=true

func _on_reponer_espina_arriba_timeout() -> void:
	$EspinaSuperior.visible=true

func _on_reponer_espina_abajo_timeout() -> void:
	$EspinaInferior.visible=true
