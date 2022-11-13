extends KinematicBody2D

var player : KinematicBody2D

export (int) var speed := 450

func _ready():
	player = get_node("../Player")
	
func _physics_process(delta):
	var player_position = player.global_position
	var direction = (player_position - global_position).normalized()
	var current_velocity = move_and_slide(direction * speed)
