extends Camera2D

@export var target: Node2D
@export var crawl_speed: float = 5
@export var follow_speed: float = 50

@onready var marker_2d: Marker2D = $Marker2D


func _process(delta: float) -> void:
	if target.global_position.y >= marker_2d.global_position.y:
		position.y += -crawl_speed * delta
	else:
		var difference = abs(marker_2d.global_position.y - target.global_position.y)
		global_position.y = move_toward(global_position.y, global_position.y - difference, follow_speed * delta)
	
