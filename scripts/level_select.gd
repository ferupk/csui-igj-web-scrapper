extends Node


func _back_to_menu() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/main_menu.tscn")
