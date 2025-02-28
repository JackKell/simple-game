extends CharacterBody2D

const CELL_SIZE = 16

const BOTTOM_BOUND = 120
const LEFT_BOUND = -72
const RIGHT_BOUND = 72
const TOP_BOUND = -120

var tween: Tween

@onready var body: Sprite2D = $Body
@onready var shadow: Sprite2D = $Shadow

@export var hopTime: float = 0.1

func _process(delta: float) -> void:
	if (Input.is_action_pressed("move_up")):
		if (position.y > TOP_BOUND):
			move(Vector2(0, -CELL_SIZE))
	elif (Input.is_action_pressed("move_down")):
		if (position.y < BOTTOM_BOUND):
			move(Vector2(0, CELL_SIZE))
	elif (Input.is_action_pressed("move_left")):
		if (position.x > LEFT_BOUND):
			move(Vector2(-CELL_SIZE, 0))
	elif (Input.is_action_pressed("move_right")):
		if (position.x < RIGHT_BOUND):
			move(Vector2(CELL_SIZE, 0))

func move(direction: Vector2):
	if (tween and tween.is_running()):
		return
	print("animate")
	tween = create_tween()
	tween.tween_property(self, "position", position + direction, hopTime)
	tween.parallel().set_ease(Tween.EASE_OUT).tween_property(body, "position", Vector2(0, -14), hopTime / 2)
	tween.tween_property(shadow, "scale", Vector2(0.025, 0.025), hopTime / 2)
	tween.chain().set_ease(Tween.EASE_IN).tween_property(body, "position", Vector2(0, -7), hopTime / 2)
	tween.tween_property(shadow, "scale", Vector2(0.05, 0.05), hopTime / 2)
	
	
	
