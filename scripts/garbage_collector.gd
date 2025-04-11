extends StaticBody2D

class_name Collector


func collect_packet(is_bonus: bool = false) -> void:
	$SFX.play()
	$AnimatedSprite2D.play("open")
	if is_bonus:
		LevelProgress.bonus_collected = true
	else:
		LevelProgress.packet_count -= 1
