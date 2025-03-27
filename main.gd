extends Node2D

@onready var camera_2d: Camera2D = $Camera2D
@onready var player: Player = $player

func _handle_player_die():
	camera_2d.global_position.y = 0

func _ready() -> void:
	player.die.connect(_handle_player_die)
