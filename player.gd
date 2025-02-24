extends CharacterBody2D

const CELL_SIZE = 16

const BOTTOM_BOUND = 120
const LEFT_BOUND = -72
const RIGHT_BOUND = 72
const TOP_BOUND = -120

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("move_up")):
		print("pressed move up")
		if (position.y > TOP_BOUND):
			position -= Vector2(0, CELL_SIZE)
	elif (Input.is_action_just_pressed("move_down")):
		print("pressed move down")
		if (position.y < BOTTOM_BOUND):
			position += Vector2(0, CELL_SIZE)
	elif (Input.is_action_just_pressed("move_left")):
		print("pressed move left")
		if (position.x > LEFT_BOUND):
			position -= Vector2(CELL_SIZE, 0)
	elif (Input.is_action_just_pressed("move_right")):
		print("pressed move right")
		if (position.x < RIGHT_BOUND):
			position += Vector2(CELL_SIZE, 0)
