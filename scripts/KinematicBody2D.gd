extends KinematicBody2D

var vida = 3

func me_diste(cantidad):
	if vida > 0:
		vida += cantidad
		

func _process(delta):
	if vida == 0:
		queue_free()
