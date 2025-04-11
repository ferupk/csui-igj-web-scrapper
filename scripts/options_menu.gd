extends Node


func _back_to_menu() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/main_menu.tscn")


func _reset_to_defaults() -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(1))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(1))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(1))
	get_tree().call_deferred("reload_current_scene")
