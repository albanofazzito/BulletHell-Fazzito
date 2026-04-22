extends Node2D



func _ready():
	$Node2D/CharacterBody2D.murio.connect(_on_raptor_murio)

func _on_raptor_murio():
	$CanvasLayer3/ColorRect.visible=true
	$AnimationPlayer.play("muerte")
	var pos_pantalla= $Node2D/CharacterBody2D.get_global_transform_with_canvas().origin
	$CanvasLayer2/ColorRect.position= pos_pantalla- Vector2(71/2, 183/2)
	print($Node2D.get_global_transform_with_canvas().origin)
	$CanvasLayer2/ColorRect.visible=true
	get_tree().paused=true
	
	
