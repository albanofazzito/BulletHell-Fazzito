extends CanvasLayer

var nuevaEscena

func _ready():
	visible=false
func cambiar_escena(escena):
	AudioServer.set_bus_volume_db(0, -20)
	visible=true
	nuevaEscena=escena
	$AnimationPlayer.play("fadeIn")



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name== "fadeIn":
		get_tree().change_scene_to_file(nuevaEscena)
		AudioServer.set_bus_volume_db(0, 0)
		$AnimationPlayer.play("fadeOut")
	elif anim_name == "fadeOut":
		visible = false
		
