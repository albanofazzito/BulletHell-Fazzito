extends Control


func _ready() -> void:
	if AutoLoad.tutorialCompletado:
		$Brachio.visible=true
	if AutoLoad.nivel2Completado:
		$StegoFosil.visible=true
	if AutoLoad.nivel2Desbloqueado:
		$MosaFosil.visible=true
