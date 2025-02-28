extends Marker2D
@export var car_template: PackedScene
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(spawn_car)
	spawn_car()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_car():
	var new_car = car_template.instantiate()
	add_child(new_car)
