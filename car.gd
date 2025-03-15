extends Area2D
@onready var sprite: Sprite2D = $Sprite

const taxi_region = Rect2(240,232,32,24)
const redcar_region = Rect2(240,264,32,24)
const convert_region = Rect2(336,272,32,16)
const car_regions: Array[Rect2] = [taxi_region,redcar_region,convert_region]
@export var speed = 16:
	set(value):
		speed = value
		sprite.flip_h = speed < 0

func _ready() -> void:
	sprite.region_rect = car_regions.pick_random()

func _process(delta: float) -> void:
	position = position + Vector2(speed * delta,0)
	if (abs(global_position.x) >= 120):
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if (body is Player):
		body.kill()
	
