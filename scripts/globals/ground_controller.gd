extends Node

@onready var foreground = $Foreground
@onready var background = $Background
@onready var fade_anim = $Foreground/AnimationPlayer


func _ready() -> void:
	foreground.visible = false
	background.visible = false


func toggle_background(visible: bool) -> void:
	background.visible = visible


func fade_in() -> void:
	foreground.visible = true
	fade_anim.play("foreground_in")
	await fade_anim.animation_finished
	foreground.visible = false


func fade_out() -> void:
	foreground.visible = true
	fade_anim.play("foreground_out")
	await fade_anim.animation_finished
	foreground.visible = false
