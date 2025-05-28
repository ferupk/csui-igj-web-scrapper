extends CharacterBody2D

const tile_size: int = 64

@onready var ray = $RayCast2D
@onready var held_item = $HeldItem
@onready var counter = $Counter
@onready var direction_guide = $DirectionGuide

@onready var sfx = {
	"pick_up": $SFX/PickUp,
	"drop": $SFX/Drop,
	"step": $SFX/Step,
}

var moving = false
var holding: Packet
var held_last_position: Vector2i
var hold_steps: int = 0

var inputs = {
	"player_left": Vector2.LEFT,
	"player_right": Vector2.RIGHT,
	"player_up": Vector2.UP,
	"player_down": Vector2.DOWN
}

var held_sprites = {
	"packet": preload("res://assets/sprites/packet.png"),
	"dead": preload("res://assets/sprites/dead_packet.png"),
	"bonus": preload("res://assets/sprites/bonus_packet.png")
}


func _ready() -> void:
	counter.visible = false


func _process(_delta: float) -> void:
	if LevelProgress.level_end:
		return

	var collider = ray.get_collider()

	if Input.is_action_just_pressed("player_action") and holding:
		if collider is Collector:
			collider.collect_packet(true if holding.bonus else false)
			holding.put_down()
			self.put_down()
		elif !ray.is_colliding():
			var new_pos = ray.target_position + self.global_position
			holding.put_down(new_pos)
			self.put_down()

	if Input.is_action_just_pressed("player_action") and !holding:
		if collider is Packet:
			holding = collider
			held_last_position = collider.position

			collider.pick_up()
			self.pick_up()

	if holding and holding.dead:
		counter.text = "X"
		counter.set_modulate(Color(1, 0, 0))
	else:
		counter.text = str(hold_steps)
		counter.set_modulate(Color(1, 1, 1))

	direction_guide.position = ray.target_position / 2
	direction_guide.rotation = ray.target_position.angle()


func _unhandled_input(event):
	if moving or LevelProgress.level_end:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)


func move(dir):
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()

	if Input.is_action_pressed("player_halt") or (holding and !(hold_steps > 0)):
		return

	if !ray.is_colliding():
		if holding:
			hold_steps -= 1

		var tween = create_tween()
		(
			tween
			. tween_property(self, "position", position + inputs[dir] * tile_size, 0.2)
			. set_trans(Tween.TRANS_EXPO)
			. set_ease(Tween.EASE_OUT)
		)

		moving = true
		sfx.step.play()
		await tween.finished
		moving = false


func pick_up():
	sfx.pick_up.play()

	if !holding.dead:
		hold_steps = 10

	if holding.dead:
		held_item.texture = held_sprites.dead
	elif holding.bonus:
		held_item.texture = held_sprites.bonus
	else:
		held_item.texture = held_sprites.packet

	counter.visible = true


func put_down():
	sfx.drop.play()

	hold_steps = 0

	holding = null
	held_item.texture = null
	counter.visible = false

	LevelProgress.pickup_count += 1
	LevelProgress.check_completion()
	LevelProgress.check_limit()
