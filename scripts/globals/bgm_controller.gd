extends Node

@onready var bgm = {
	"menu": load("res://assets/sounds/menu_bgm.mp3"),
	"game": load("res://assets/sounds/game_bgm.mp3"),
}


func _ready() -> void:
	$BGM.stream = bgm.menu


func play() -> void:
	$BGM.play()


func stop() -> void:
	$BGM.stop()


func change_music(music) -> void:
	$BGM.stream = bgm[music]
	$BGM.play()
