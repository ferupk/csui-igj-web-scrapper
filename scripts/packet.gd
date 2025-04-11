extends StaticBody2D

class_name Packet

@export var dead = false
@export var bonus = false

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D


func pick_up():
	sprite.visible = false
	collision.set_deferred("disabled", true)


func put_down(new_pos: Vector2 = Vector2.ZERO):
	if new_pos:
		sprite.visible = true
		collision.set_deferred("disabled", false)
		global_position = new_pos
	else:
		self.queue_free()
