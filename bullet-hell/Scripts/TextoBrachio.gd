extends Node2D
var panel

func _ready():
	panel= get_parent().get_node("Node2D/Panel")

func inicializar(texto,x,y):
	$Node2D/Panel/Label.text = texto
	position.x=x
	position.y=y



func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		$Node2D/Panel.visible = true


func _on_area_2d_body_exited(body):
	if body.is_in_group("Jugador"):
		$Node2D/Panel.visible = false
