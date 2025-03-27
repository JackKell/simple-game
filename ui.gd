extends CanvasLayer


@onready var player: Player = $"../player"
@onready var current_label: Label = $current_label
@onready var best_label: Label = $best_label
var best_value:int = 0
var highest_value: int = 0
var start_position: float

func reset_score():
	if(highest_value > best_value):
		best_value = highest_value
		best_label.text = str(best_value)
	highest_value = 0
	current_label.text = str(0)


func _ready() -> void:
	start_position = player.global_position.y 
	player.die.connect(reset_score)

func _process(delta: float) -> void:
	var current_value: int = int((player.global_position.y - start_position) * -1)/16
	if(current_value > highest_value):
		current_label.text = str(current_value)
		highest_value = current_value
