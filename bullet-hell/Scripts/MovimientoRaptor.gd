extends CharacterBody2D


var velocidad= 200.0
var invencible=false
var escenaDisparo= preload("res://Escenas/DisparoRaptor.tscn")
var disparando=true

func _physics_process(delta):
	if AutoLoad.vidas>0:
		var direccion= Input.get_vector("mover_izquierda","mover_derecha","mover_arriba","mover_abajo")
		if direccion.y<0 and direccion.x==0:
			$AnimatedSprite2D.play("Arriba")
			$AnimatedSprite2D.flip_v=false
		elif direccion.y>0 and direccion.x==0:
			$AnimatedSprite2D.play("Arriba")
			$AnimatedSprite2D.flip_v=true
		if direccion.x> 0:
			$AnimatedSprite2D.flip_v=false
			$AnimatedSprite2D.play("default")
			$AnimatedSprite2D.flip_h= true
		elif direccion.x< 0:
			$AnimatedSprite2D.flip_v=false
			$AnimatedSprite2D.play("default")
			$AnimatedSprite2D.flip_h= false
		if direccion==Vector2.ZERO:
			$AnimatedSprite2D.pause()
		else:
			$AnimatedSprite2D.play()
		velocity = direccion * velocidad * delta * 100
		if Input.is_action_pressed("disparar"):
			disparar(direccion)
		move_and_slide()



func recibirDaño():
	if invencible==false and AutoLoad.vidas>=1:
		$VidaPerdida.play()
		$BoxContainer.mostrarVidas()
		AutoLoad.vidas-=1
		invencible=true
		$TimerParpadeo.start()
		$Timer.start()
		$AnimatedSprite2D.visible=true
		if AutoLoad.vidas==0:
			$AnimatedSprite2D2.visible=true
			$AnimatedSprite2D.visible=false
			$AnimatedSprite2D2.play()


func _on_timer_timeout():
	invencible=false

func disparar(direccion):
	if disparando==true:
		var disparo=escenaDisparo.instantiate()
		var dir= Vector2.ZERO
		if $AnimatedSprite2D.animation=="default":
			if !$AnimatedSprite2D.flip_h:
				dir=Vector2(-1,0)
			else:
				dir=Vector2(1,0)
		else:
			if !$AnimatedSprite2D.flip_v:
				dir=Vector2(0,-1)
			else:
				dir=Vector2(0,1)
		disparo.iniciar(dir)
		get_parent().add_child(disparo)
		disparo.global_position= global_position
		$cooldown.start()
		disparando=false

func _on_timer_parpadeo_timeout():
	if invencible==true and AutoLoad.vidas!=0:
		$AnimatedSprite2D.visible = !$AnimatedSprite2D.visible
		$TimerParpadeo.start()


func _on_animated_sprite_2d_2_animation_finished():
	$AnimatedSprite2D2.pause()


func _on_cooldown_timeout():
	disparando=true
