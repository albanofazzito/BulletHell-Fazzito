extends Node2D
var escenaEspina= preload("res://Escenas/Espina.tscn")
var escenaEspinaDirigida= preload("res://Escenas/espinaDirigida.tscn")
var vida=100
var muerto=false

func _ready():
	_on_animated_sprite_2d_frame_changed()
	$TimerDisparoArriba.start(randf_range(2,4))
	$TimerDisparoMedio.start(randf_range(5,8))
	$TimerDisparoAbajo.start(randf_range(3,6))
	$TimerDisparoDirigido.start(randf_range(1,4))

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
	if vida<=0:
		morir()
	


func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		body.recibirDaño()

func morir():
	muerto=true
	queue_free()


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
	$TimerDisparoMedio.start(randf_range(5,8))
	
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
	$TimerDisparoAbajo.start(randf_range(3,6))

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
	$TimerDisparoArriba.start(randf_range(2,4))


func _on_reponer_espina_medio_timeout() -> void:
	$EspinaMedio.visible=true

func _on_reponer_espina_arriba_timeout() -> void:
	$EspinaSuperior.visible=true

func _on_reponer_espina_abajo_timeout() -> void:
	$EspinaInferior.visible=true


func _on_timer_disparo_dirigido_timeout():
	var jugador = get_tree().get_first_node_in_group("Jugador")
	var espinaDirigida=escenaEspinaDirigida.instantiate()
	get_parent().add_child(espinaDirigida)
	espinaDirigida.global_position= $Espinillas.global_position
	var dir = (jugador.global_position - espinaDirigida.global_position).normalized()
	if global_position.x<500:
		espinaDirigida.global_position.x+= 100
		espinaDirigida.inicializar(dir)
	else:
		espinaDirigida.global_position.x-= 100
		espinaDirigida.inicializar(dir)
	$Espinillas.visible=false
	$ReponerEspinillas.start(1)
	$TimerDisparoDirigido.start(randf_range(1,4))

func _on_reponer_espinillas_timeout():
	$Espinillas.visible=true


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("DisparoRaptor"):
		area.queue_free()
		vida-=2
		herir()
		$TimerHerido.start()


func _on_zona_debil_body_entered(body):
	if body.is_in_group("Jugador"):
		body.recibirDaño()


func _on_zona_debil_area_entered(area):
	if area.is_in_group("DisparoRaptor"):
		area.queue_free()
		vida-=1
		herir()
		$TimerHerido.start()


func _on_timer_herido_timeout() -> void:
		$AnimatedSprite2D.modulate= Color(1,1,1)
		$EspinaSuperior.modulate= Color(1,1,1)
		$EspinaInferior.modulate= Color(1,1,1)
		$EspinaMedio.modulate= Color(1,1,1)
		$Espinillas.modulate= Color(1,1,1)
		
func herir():
	$AnimatedSprite2D.modulate= Color(1,0,0)
	$EspinaSuperior.modulate= Color(1,0,0)
	$EspinaInferior.modulate= Color(1,0,0)
	$EspinaMedio.modulate= Color(1,0,0)
	$Espinillas.modulate= Color(1,0,0)
