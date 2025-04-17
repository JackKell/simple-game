extends Node2D

@onready var blob_shadow: Sprite2D = %BlobShadow
@onready var rock: Sprite2D = %Rock

signal landed

func get_rand_point_unit_circle():
	var angle = randf_range(PI, TAU)
	return Vector2(cos(angle), sin(angle))


func _ready() -> void:
	rock.position = get_rand_point_unit_circle() * 300
	blob_shadow.modulate.a = 0
	const fall_time = 2
	var tween = get_tree().create_tween()
	tween.tween_property(rock, "global_position", blob_shadow.global_position, fall_time)
	tween.parallel().tween_property(blob_shadow, "scale", rock.scale, fall_time).set_delay(0.5)
	tween.parallel().tween_property(blob_shadow, "modulate:a", 0.8, fall_time)
	await tween.finished
	landed.emit()
	queue_free()
