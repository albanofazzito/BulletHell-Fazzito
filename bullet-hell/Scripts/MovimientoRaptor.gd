extends CharacterBody2D


var velocidad = 300.0


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
