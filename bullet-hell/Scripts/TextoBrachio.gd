extends Node2D
var panel
var letraIndex = 0
var textoActual
func _ready():
	panel= get_parent().get_node("Node2D/Panel")
	

func inicializar(texto,x,y):
	position.x=x
	position.y=y
	textoActual=texto
	letraIndex=0
	$TimerEscritura.start()




func _on_timer_escritura_timeout():
	$Node2D/Panel/Label.text = textoActual.substr(0, letraIndex)
	if letraIndex<=textoActual.length():
		$BrachioSfx.play()
	letraIndex+=1
