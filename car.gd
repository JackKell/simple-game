extends Area2D

@export var speed = 16


func _process(delta: float) -> void:
	position = position + Vector2(speed * delta,0)


func _on_body_entered(body: Node2D) -> void:
	if (body is Player):
		body.kill()
