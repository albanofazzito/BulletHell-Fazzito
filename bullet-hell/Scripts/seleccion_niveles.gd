extends Control


var niveles=[]
var seleccionado=0
var nivelesIndex=0


func _ready():
	niveles = [$HBoxContainer/Panel, $HBoxContainer/Panel2, $HBoxContainer/Panel3]
func _input(event):
	if event.is_action_pressed("mover_derecha"):
		nivelesIndex+=1
	elif event.is_action_pressed("mover_izquierda"):
		nivelesIndex-=1
	nivelesIndex=clamp(nivelesIndex,0,2)
	for nivel in niveles:
		nivel.modulate = Color(1, 1, 1, 1) 
		nivel.scale=Vector2(0.8,0.8)
		nivel.pivot_offset= nivel.size/ 2
	niveles[nivelesIndex].modulate= Color(0.387, 0.384, 0.334, 1.0)
	niveles[nivelesIndex].scale=Vector2(1.2,1.2)
	niveles[nivelesIndex].pivot_offset= niveles[nivelesIndex].size/2
	if event.is_action_pressed("disparar"):
		if nivelesIndex==0:
			Loading.cambiar_escena("res://Escenas/Tutorial.tscn")
		elif nivelesIndex==1:
			Loading.cambiar_escena("res://Escenas/Nivel2.tscn")
		else:
			Loading.cambiar_escena("res://Escenas/Juego.tscn")
		
