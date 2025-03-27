extends Node2D
@export var player: Player
@export var tracked_pieces: Array[PackedScene]
@export var start_chunk: Node2D

var offset = 0
var chunk_height = 256

func _ready() -> void:
	spawn_chunk()

func spawn_chunk():
	var random_scene: PackedScene = tracked_pieces.pick_random()
	var selected_scene = random_scene.instantiate()
	offset -= chunk_height
	selected_scene.position = Vector2(0,offset)
	
	add_child(selected_scene)
	
func _process(delta: float) -> void:
	if (player.global_position.y <= offset):
		spawn_chunk()
