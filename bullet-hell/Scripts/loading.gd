extends CanvasLayer

var nuevaEscena

func _ready():
	visible=false
func cambiar_escena(escena):
	var volumen_actual = AudioServer.get_bus_volume_db(0)
	AudioServer.set_bus_volume_db(0, volumen_actual - 10)
	visible=true
	nuevaEscena=escena
	$AnimationPlayer.play("fadeIn")



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name== "fadeIn":
		if nuevaEscena == get_tree().current_scene.scene_file_path:
			get_tree().reload_current_scene()
		else:
			get_tree().change_scene_to_file(nuevaEscena)
		AudioServer.set_bus_volume_db(0, linear_to_db(AutoLoad.volumen / 100.0))
		$AnimationPlayer.play("fadeOut")
	elif anim_name == "fadeOut":
		visible = false
		
