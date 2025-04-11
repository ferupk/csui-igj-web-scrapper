extends Node

@export var bus: String = "Master"

@onready var label = $Label
@onready var slider = $Slider

var bus_index: int


func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus)
	slider.value_changed.connect(_change_volume_value)

	var current_value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	label.text = bus + ": " + str(current_value * 100) + "%"
	slider.value = current_value


func _change_volume_value(value: float) -> void:
	label.text = bus + ": " + str(value * 100) + "%"
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
