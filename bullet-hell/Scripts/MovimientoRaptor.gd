extends CharacterBody2D


var velocidad = 300.0
var invencible=false

func _physics_process(delta):

	var direccion = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direccion.x>0:
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.flip_h = false
		
	if direccion==Vector2.ZERO:
		$AnimatedSprite2D.pause()
	velocity = direccion * velocidad * delta * 100
	
	
	
	move_and_slide()

func recibirDaño():
	if invencible==false:
		AutoLoad.vidas-=1
		invencible=true
		$TimerParpadeo.start
		$Timer.start()



func _on_timer_timeout() -> void:
	invencible=false


func _on_timer_parpadeo_timeout() -> void:
	$AnimatedSprite2D.visible = !$AnimatedSprite2D.visible
