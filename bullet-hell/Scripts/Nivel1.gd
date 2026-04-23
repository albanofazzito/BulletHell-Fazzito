extends Node2D



func _ready():
	$Node2D/CharacterBody2D.murio.connect(_on_raptor_murio)
	print($Node2D/CharacterBody2D/Camera2D.enabled)

func _on_raptor_murio():
	print($Node2D/CharacterBody2D.global_position)
	var pos_pantalla= $Node2D/CharacterBody2D.get_global_transform_with_canvas().origin
	$Node2D/CharacterBody2D/AnimatedSprite2D2.visible=true
	$Node2D/CharacterBody2D/AnimatedSprite2D2.play()
	$Node2D/CharacterBody2D/ColorRect.visible=true
	$Node2D/CharacterBody2D/AnimationPlayer.play("muerte")
	$Node2D/CharacterBody2D/ColorRect2.visible=true
	get_tree().paused=true
	
func _on_animated_sprite_2d_2_animation_finished():
	$Node2D/CharacterBody2D/AnimatedSprite2D2.pause()
