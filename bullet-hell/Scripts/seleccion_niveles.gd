extends Control


var niveles=[]
var seleccionado=0
var nivelesIndex=0


func _ready():
	niveles = [$HBoxContainer/Tutorial, $HBoxContainer/Nivel1, $HBoxContainer/Nivel2]
func _input(event):
	if event.is_action_pressed("mover_derecha"):
		nivelesIndex+=1
	elif event.is_action_pressed("mover_izquierda"):
		nivelesIndex-=1
	nivelesIndex=clamp(nivelesIndex,0,2)
	for nivel in niveles:
		nivel.modulate = Color(1, 1, 1, 1) 
	niveles[nivelesIndex].modulate= Color(0.649, 0.646, 0.587, 1.0)
	if event.is_action_pressed("disparar"):
		if nivelesIndex==0:
			Loading.cambiar_escena("res://Escenas/Tutorial.tscn")
		elif nivelesIndex==1:
			Loading.cambiar_escena("res://Escenas/Juego.tscn")
		
