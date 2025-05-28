extends Node

@onready var sfx = $SFX


func _ready() -> void:
	sfx.play()


func _retry_level() -> void:
	await GroundController.fade_in()
	get_tree().call_deferred("reload_current_scene")
	GroundController.fade_out()
	self.queue_free()


func _to_level_select() -> void:
	await GroundController.fade_in()
	get_tree().call_deferred("change_scene_to_file", "res://scenes/level_select.tscn")
	BGMController.change_music("menu")
	GroundController.toggle_background(true)
	GroundController.fade_out()
	self.queue_free()
