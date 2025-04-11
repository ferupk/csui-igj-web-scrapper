extends Node

var packet_count: int
var pickup_limit: int
var pickup_par: int

var pickup_count: int = 0
var bonus_collected: bool = false
var level_completed: bool = false


func reset_progress():
	pickup_count = 0
	bonus_collected = false
	level_completed = false


func check_completion():
	if packet_count == 0:
		var scene = preload("res://scenes/level_complete.tscn")
		add_child(scene.instantiate())


func check_limit():
	if pickup_limit == pickup_count and packet_count > 0:
		var scene = preload("res://scenes/level_lost.tscn")
		add_child(scene.instantiate())


func check_par() -> bool:
	return true if (pickup_count <= pickup_par) else false


func pickups_left():
	return pickup_limit - pickup_count
