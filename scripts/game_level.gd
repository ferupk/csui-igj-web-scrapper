extends Node2D

@export var packet_count = 1
@export var pickup_limit = 8
@export var pickup_par = 8


func _ready() -> void:
	LevelProgress.reset_progress()

	LevelProgress.packet_count = packet_count
	LevelProgress.pickup_limit = pickup_limit
	LevelProgress.pickup_par = pickup_par


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("restart") and !LevelProgress.level_end:
		LevelProgress.end_level()
		await GroundController.fade_in()
		get_tree().call_deferred("reload_current_scene")
		GroundController.fade_out()
