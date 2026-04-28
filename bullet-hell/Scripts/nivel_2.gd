extends Node2D


var PteroEscena
func _ready() -> void:
	$Node2D2/CharacterBody2D.murio.connect(_on_raptor_murio)
	PteroEscena=preload("res://Escenas/Pterodactilo.tscn")
	$TimerPterodactilos.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_raptor_murio():
	var pos_pantalla= $Node2D2/CharacterBody2D.get_global_transform_with_canvas().origin
	$Node2D2/CharacterBody2D/AnimatedSprite2D2.visible=true
	$Node2D2/CharacterBody2D/AnimatedSprite2D2.play()
	$Node2D2/CharacterBody2D/ColorRect.visible=true
	$Node2D2/CharacterBody2D/AnimationPlayer.play("muerte")
	$Node2D2/CharacterBody2D/ColorRect2.visible=true
	get_tree().paused=true

func _on_timer_pterodactilos_timeout() -> void:
	var pterodactilo= PteroEscena.instantiate()
	pterodactilo.global_position= Vector2([0,1199].pick_random(),32)
	add_child(pterodactilo)
	pterodactilo.inicializar(pterodactilo.global_position)
	$TimerPterodactilos.start()
