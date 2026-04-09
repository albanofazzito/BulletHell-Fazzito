extends Node2D
func _ready():
	_on_animated_sprite_2d_frame_changed()

func _on_animated_sprite_2d_frame_changed():
	if $AnimatedSprite2D.frame==0 :
		$Area2D/ColaIzquierda.disabled=false
	else:
		$Area2D/ColaIzquierda.disabled=true
	if $AnimatedSprite2D.frame==1 or $AnimatedSprite2D.frame==11:
		$Area2D/ColaSemiIzquierda.disabled=false
	else:
		$Area2D/ColaSemiIzquierda.disabled=true
	if $AnimatedSprite2D.frame==2 or $AnimatedSprite2D.frame==10:
		$Area2D/ColaCasiIzquierda.disabled=false
	else:
		$Area2D/ColaCasiIzquierda.disabled=true
	if $AnimatedSprite2D.frame==3 or $AnimatedSprite2D.frame==9:
		$Area2D/ColaMedio.disabled=false
	else:
		$Area2D/ColaMedio.disabled=true
	if $AnimatedSprite2D.frame==4 or $AnimatedSprite2D.frame==8:
		$Area2D/ColaCasiDerecha.disabled=false
	else:
		$Area2D/ColaCasiDerecha.disabled=true
	if $AnimatedSprite2D.frame==5 or $AnimatedSprite2D.frame==7:
		$Area2D/ColaSemiDerecha.disabled=false
	else:
		$Area2D/ColaSemiDerecha.disabled=true
	if $AnimatedSprite2D.frame==6:
		$Area2D/ColaDerecha.disabled=false
	else:
		$Area2D/ColaDerecha.disabled=true
	


func _on_area_2d_body_entered(body):
	if body.is_in_group("Jugador"):
		AutoLoad.vidas-=1
		print("hola")
