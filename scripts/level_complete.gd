extends Node

@onready
var beat_objective = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Objectives/BeatObjective
@onready
var par_objective = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Objectives/ParObjective
@onready
var bonus_objective = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Objectives/BonusObjective
@onready var sfx = $SFX


func _ready() -> void:
	sfx.play()

	par_objective.update_objective(
		"Beat the level in " + str(LevelProgress.pickup_par) + " moves or less"
	)

	beat_objective.complete_objective()

	if LevelProgress.check_par():
		par_objective.complete_objective()

	if LevelProgress.bonus_collected:
		bonus_objective.complete_objective()


func _to_level_select() -> void:
	await GroundController.fade_in()
	get_tree().call_deferred("change_scene_to_file", "res://scenes/level_select.tscn")
	BGMController.change_music("menu")
	GroundController.toggle_background(true)
	GroundController.fade_out()
	self.queue_free()
