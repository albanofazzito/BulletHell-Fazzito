extends Node2D

var stegosRestantes=2
var letraIndex=0
func _ready():
	get_tree().paused=true
	$Node2D/CharacterBody2D.murio.connect(_on_raptor_murio)
	print($Node2D/CharacterBody2D/Camera2D.enabled)

func _on_raptor_murio():
	print($Node2D/CharacterBody2D.global_position)
	var pos_pantalla= $Node2D/CharacterBody2D.get_global_transform_with_canvas().origin
	$Node2D/CharacterBody2D/AnimatedSprite2D2.visible=true
	$Node2D/CharacterBody2D/AnimatedSprite2D2.play()
	$Node2D/CharacterBody2D/ColorRect.visible=true
	$Node2D/CharacterBody2D/AnimationPlayer.play("muerte")
	$Node2D/CharacterBody2D/ColorRect2.visible=true
	get_tree().paused=true
	
func _on_animated_sprite_2d_2_animation_finished():
	$Node2D/CharacterBody2D/AnimatedSprite2D2.pause()
	
func restarObjetivo():
	stegosRestantes-=1
	print(stegosRestantes)
	if stegosRestantes==0:
		mostrarVictoria()


func mostrarVictoria():
	$Node2D/CharacterBody2D/AnimationPlayer.play("fadeOut")
	$TimerVictoria.start()


func _on_animation_player_animation_finished(anim_name):
	if anim_name=="fadeIn":
		$CanvasLayer/Label.visible=true
		$TimerEscritura.start()
	if anim_name=="Ready? Wallop!":
		$CanvasLayer/Label.visible=false
		get_tree().paused=false
		$CanvasLayer/AnimationPlayer.stop()

func _on_timer_escritura_timeout():
	$CanvasLayer/Label.text = "Ready?".substr(0, letraIndex)
	letraIndex+=1
	if letraIndex>= "Ready?".length()+1:
		$Timer.start()
	else:
		$TimerEscritura.start()





func _on_timer_timeout() -> void:
	$CanvasLayer/Label.text="Wallop!"
	$CanvasLayer/AnimationPlayer.play("Ready? Wallop!")


func _on_timer_victoria_timeout() -> void:
	Loading.cambiar_escena("res://Escenas/SeleccionNiveles.tscn")
