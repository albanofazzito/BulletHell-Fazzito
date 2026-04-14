extends Node2D


var velocidad= Vector2(100,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x=velocidad*delta
