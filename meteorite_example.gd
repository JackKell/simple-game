extends Node2D

const METEORITE = preload("res://meteorite.tscn")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			var spawn_pos = get_global_mouse_position()
			var metorite = METEORITE.instantiate()
			metorite.global_position = spawn_pos
			metorite.landed.connect(_shake_screen)
			add_child(metorite)
			

func _shake_screen():
	print("shake the screen")
