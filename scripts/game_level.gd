extends Node2D

@export var packet_count = 1
@export var pickup_limit = 8
@export var pickup_par = 8


func _ready() -> void:
	LevelProgress.reset_progress()

	LevelProgress.packet_count = packet_count
	LevelProgress.pickup_limit = pickup_limit
	LevelProgress.pickup_par = pickup_par
