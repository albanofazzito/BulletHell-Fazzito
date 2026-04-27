extends Node2D


var PteroEscena
func _ready() -> void:
	PteroEscena=preload("res://Escenas/Pterodactilo.tscn")
	$TimerPterodactilos.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_pterodactilos_timeout() -> void:
	var pterodactilo= PteroEscena.instantiate()
	pterodactilo.global_position= Vector2([0,1199].pick_random(),32)
	add_child(pterodactilo)
	pterodactilo.inicializar(pterodactilo.global_position)
	$TimerPterodactilos.start()
