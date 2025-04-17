extends CharacterBody2D
class_name Player
const CELL_SIZE = 16

signal die

const BOTTOM_BOUND = 120
const LEFT_BOUND = -72
const RIGHT_BOUND = 72

var start_position: Vector2

@export var skin: CharacterSkin 

@onready var body: Sprite2D = $Body
@onready var shadow: Sprite2D = $Shadow
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var ray_cast: RayCast2D = $RayCast2D

const HOP = "hop"
var is_hopping: bool = false
var hop_tween: Tween = null

func _ready() -> void:
	start_position = global_position
	body.texture = skin.down_image

func _process(delta: float) -> void:
	if (Input.is_action_pressed("move_up")):
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
	_update_facing_dirction(direction)
	ray_cast.target_position = direction
	ray_cast.force_raycast_update()
	if (ray_cast.is_colliding()):
		return
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
	animation_player.play("RESET")
	is_hopping = false
	body.texture = skin.down_image
	global_position = start_position
	die.emit()

func _update_facing_dirction(direction: Vector2):
	if (direction.x < 0):
		body.texture = skin.left_image
	elif direction.x > 0:
		body.texture = skin.right_image
	elif direction.y > 0:
		body.texture = skin.down_image
	elif direction.y < 0:
		body.texture = skin.up_image
	
