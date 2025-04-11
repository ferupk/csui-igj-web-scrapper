extends Node


func _process(_delta: float) -> void:
	$PacketCounter.text = str(LevelProgress.packet_count)
	$PickupCounter.text = str(LevelProgress.pickups_left())
	$BonusFlag.text = "Bonus Collected: " + ("Yes!" if LevelProgress.bonus_collected else "No.")
