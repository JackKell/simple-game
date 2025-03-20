extends Camera2D
@export var target: Node2D

func _process(delta: float) -> void:
	if (target.global_position.y > global_position.y):
		return
	var value = move_toward(global_position.y,target.global_position.y,50 * delta)
	global_position.y = value
	
