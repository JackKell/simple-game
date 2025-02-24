extends Node2D

@export var camera_speed: float = 0
@onready var camera: Camera2D = $Camera2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var currentPosition = camera.position.y
	var targetPosition = currentPosition - camera_speed
	camera.position.y = move_toward(camera.position.y, targetPosition, camera_speed * delta) 
