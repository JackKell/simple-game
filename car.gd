extends Area2D

@export var speed = 16:
	set(value):
		speed = value
		print(speed)
		$Sprite.flip_h = speed < 0

func _process(delta: float) -> void:
	position = position + Vector2(speed * delta,0)
	if (abs(global_position.x) >= 120):
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if (body is Player):
		body.kill()
	
