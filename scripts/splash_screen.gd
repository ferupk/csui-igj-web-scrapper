extends PanelContainer

@onready var splash_anim = $AnimationPlayer


func _ready() -> void:
	splash_anim.play("splash")
	await splash_anim.animation_finished
	get_tree().call_deferred("change_scene_to_file", "res://scenes/main_menu.tscn")
	BGMController.play()
	GroundController.toggle_background(true)
	GroundController.fade_out()
