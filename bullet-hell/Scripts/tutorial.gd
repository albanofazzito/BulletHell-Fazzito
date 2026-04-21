extends Node2D

var BrachioEscena
var mensajes=["Usa WASD para moverte","Presiona Espacio, K o L para disparar", "Evita los proyectiles enemigos"]
var mensajesIndex=0
var Brachio
var objetivosRestantes=4
var CostillasEscena
var costilla
var meteoritoEscena
var meteoritos=0
func _ready():
	meteoritoEscena= preload("res://Escenas/Meteorito.tscn")
	CostillasEscena=preload("res://Escenas/Costillas.tscn")
	BrachioEscena=preload("res://Escenas/Brachio.tscn")
	Brachio=BrachioEscena.instantiate()
	add_child(Brachio)
	Brachio.inicializar(mensajes[mensajesIndex],560.0,160.0)
	$TimerMensajes.start()

func _on_timer_mensajes_timeout() -> void:
	mensajesIndex+=1
	Brachio.inicializar(mensajes[mensajesIndex],560.0,160.0)
	$Node2D3.visible=true
	$Node2D4.visible=true
	$Node2D5.visible=true
	$Node2D6.visible=true
	
func restarObjetivo():
	objetivosRestantes-= 1
	if objetivosRestantes== 0:
		iniciarUltimaParte()
		
func iniciarUltimaParte():
	mensajesIndex+= 1
	Brachio.inicializar(mensajes[mensajesIndex], 560.0, 160.0)

	for i in range(5):
		$TimerMeteoritos.start()


func _on_timer_meteoritos_timeout() -> void:
	if meteoritos<75:
		var meteorito= meteoritoEscena.instantiate()
		add_child(meteorito)
		meteorito.global_position= Vector2(randf_range(0,1152),-10)
		meteorito.inicializar(Vector2.from_angle(90))
		meteoritos+=1
	else:
		$TimerMeteoritos.stop()
