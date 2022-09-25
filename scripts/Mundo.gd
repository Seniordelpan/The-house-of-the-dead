extends Node2D

var municion_maxima = 6
onready var municion_actual = municion_maxima
var area_en_la_mira = null
signal cambiar_vida(cantidad)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	var _ce = self.connect("cambiar_vida", $Enemigo, "me_diste")

func get_input(_delta):
	if Input.is_action_just_pressed("disparar"):
		if municion_actual > 0:
			municion_actual -= 1
			disparar()
		cambiar_municion_representada()
	if Input.is_action_just_pressed("recargar"):
		if municion_actual < municion_maxima:
			municion_actual = municion_maxima
		cambiar_municion_representada()

func _physics_process(delta):
	get_input(delta)

func cambiar_municion_representada():
	var _frame = municion_maxima - municion_actual
	$ui/Balas.frame = _frame

func _on_mirilla_area_entered(area):
	area_en_la_mira = area

func _on_mirilla_area_exited(area):
	area_en_la_mira = null

func disparar():
	if area_en_la_mira != null:
		emit_signal("cambiar_vida", -1)
