extends Marker2D
@export var min_spawn_time = 2
@export var max_spawn_time = 5
@export var car_template: PackedScene
@onready var timer: Timer = $Timer
@export var car_speed = 8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(spawn_car)
	timer.wait_time = randf_range(0,1)
	timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_car():
	var new_car = car_template.instantiate()
	add_child(new_car)
	timer.wait_time = randf_range(min_spawn_time,max_spawn_time)
	timer.start()
	new_car.speed = car_speed
	# setting the timer to be one of the spawn times
