extends Node


func _play_game() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/level_select.tscn")


func _to_options() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/options_menu.tscn")


func _to_credits() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/credits.tscn")
