extends CharacterBody2D
class_name Player
const CELL_SIZE = 16

const BOTTOM_BOUND = 120
const LEFT_BOUND = -72
const RIGHT_BOUND = 72
const TOP_BOUND = -120

var start_position: Vector2

@export var up_image: int = 1
@export var down_image: int = 2
@export var left_image: int = 0
@export var right_image: int = 3

@onready var body: Sprite2D = $Body
@onready var shadow: Sprite2D = $Shadow
@onready var animation_player: AnimationPlayer = $AnimationPlayer

const HOP = "hop"
var is_hopping: bool = false
var hop_tween: Tween = null

func _ready() -> void:
	start_position = global_position

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
	if (is_hopping):
		return
	if (direction.x < 0):
		body.frame = left_image
	elif direction.x > 0:
		body.frame = right_image
	elif direction.y > 0:
		body.frame = up_image
	elif direction.y < 0:
		body.frame = down_image
	is_hopping = true
	animation_player.play(HOP)
	var hop_time = animation_player.get_animation(HOP).length
	var target_global_position = global_position + direction 
	hop_tween = create_tween()
	hop_tween.tween_property(self, "global_position", target_global_position, hop_time)
	await animation_player.animation_finished
	is_hopping = false 

func kill():
	if (hop_tween and hop_tween.is_running()):
		hop_tween.kill()
		hop_tween = null
	is_hopping = false
	animation_player.play("reset")
	global_position = start_position
	
