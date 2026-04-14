extends HBoxContainer


func mostrarVidas():
	if AutoLoad.vidas==3:
		visible=true
		$vida1.visible=true
		$vida2.visible=true
	elif AutoLoad.vidas==2:
		visible=true
		$vida2.visible=false
		$vida1.visible=true
	else:
		visible=false


func _on_timer_timeout() -> void:
	visible=false
