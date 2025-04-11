extends Area2D

@onready var sprite: Sprite2D = $Sprite

const GREEN_CAR = preload("res://car_textures/green_car.tres")
const RED_CAR = preload("res://car_textures/red_car.tres")
const YELLOW_CAR = preload("res://car_textures/yellow_car.tres")

const car_regions: Array[Texture] = [
	GREEN_CAR, 
	RED_CAR, 
	YELLOW_CAR
]

@export var speed = 16:
	set(value):
		speed = value
		sprite.flip_h = speed < 0

func _ready() -> void:
	sprite.texture = car_regions.pick_random()

func _process(delta: float) -> void:
	position = position + Vector2(speed * delta,0)
	if (abs(global_position.x) >= 120):
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if (body is Player):
		body.kill()
	
