extends Node2D

var BrachioEscena

func _ready():
	BrachioEscena=preload("res://Escenas/Brachio.tscn")
	var Brachio=BrachioEscena.instantiate()
	add_child(Brachio)
	Brachio.inicializar("Usa WASD para moverte",660.0,260.0)
