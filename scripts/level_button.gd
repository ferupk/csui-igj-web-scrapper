extends Button

@export var level: String = "level_1"
@export var extra_variant: bool = false


func _on_pressed() -> void:
	$SFX.play()
	await GroundController.fade_in()
	get_tree().call_deferred(
		"change_scene_to_file",
		"res://scenes/levels/" + ("ex/" if extra_variant else "") + level + ".tscn"
	)
	BGMController.change_music("game")
	GroundController.toggle_background(false)
	GroundController.fade_out()
