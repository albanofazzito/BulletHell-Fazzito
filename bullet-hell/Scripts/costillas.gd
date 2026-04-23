extends Node2D

var vida=5
var tutorial 

func _ready():
	tutorial=get_tree().get_first_node_in_group("Tutorial")

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("DisparoRaptor"):
		area.queue_free()
		vida-=1
		$Area2D/Sprite2D.modulate= Color(1,0,0)
		$TimerHerido.start()
		if vida<=0:
			$Area2D.collision_layer = 0
			$Area2D.collision_mask = 0
			$TimerParpadeo.start()
			$TimerMuerte.start()



func _on_timer_herido_timeout() -> void:
	$Area2D/Sprite2D.modulate= Color(1,1,1)


func _on_timer_parpadeo_timeout():
	$Area2D/Sprite2D.visible= !$Area2D/Sprite2D.visible
	$TimerParpadeo.start()


func _on_timer_muerte_timeout():
	queue_free()
	tutorial.restarObjetivo()
