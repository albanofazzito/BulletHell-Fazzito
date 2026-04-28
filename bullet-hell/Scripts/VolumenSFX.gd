extends TextureRect



var slider
var texturas
func _ready():
	texturas = [preload("res://Sprites/Sonido/SonidoCero.png"), preload("res://Sprites/Sonido/SonidoBajo.png"), preload("res://Sprites/Sonido/SonidoMedio.png"), preload("res://Sprites/Sonido/SonidoAlto.png")]
	slider= get_parent().get_node("HSlider3")
	texture = texturas[3]
	slider.value = AutoLoad.volumenSFX
	_on_h_slider_3_value_changed(AutoLoad.volumenSFX)



func _on_h_slider_3_value_changed(value: float) -> void:
	var volumen= int(value)/30
	if value!=0 and value<30:
		volumen=1
	texture = texturas[volumen]
	if value== 0:
		AudioServer.set_bus_volume_db(2, -80)  
	else:
		AudioServer.set_bus_volume_db(2, linear_to_db(value / 100.0))
	AutoLoad.volumenSFX=value
