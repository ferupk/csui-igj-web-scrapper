extends Node

@export var objective: String = "Complete the objective"

@onready var checkbox = $CheckBox
@onready var label = $Label


func _ready() -> void:
	label.text = objective


func _on_check_box_mouse_exited():
	return


func update_objective(new_objective: String) -> void:
	label.text = new_objective


func complete_objective() -> void:
	checkbox.button_pressed = true
