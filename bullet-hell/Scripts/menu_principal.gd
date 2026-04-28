extends Control


func _process(delta: float) -> void:
	if AutoLoad.tutorialCompletado:
		$Brachio.visible=true
