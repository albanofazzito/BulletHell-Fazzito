extends Node2D
var panel

func _ready():
	panel= get_parent().get_node("Node2D/Panel")
	

func inicializar(texto,x,y):
	$Node2D/Panel/Label.text = texto
	position.x=x
	position.y=y
