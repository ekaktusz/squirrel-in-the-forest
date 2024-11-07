extends CharacterBody2D

@onready var npc: CharacterBody2D = $"."
@export var style : int
const SPEED = 60
const ACCELERATION = 2
var direction: Vector2 = Vector2.UP
var direction_2: Vector2 = Vector2.LEFT
		
func _process(_delta):
	if (style == Globals.NpcType.UP_DOWN):
		("shpuld move updown")
		velocity = direction * SPEED * ACCELERATION
		move_and_slide()
		if is_on_ceiling() or is_on_floor():
			change_direction()
	elif (style == Globals.NpcType.SIDE_TO_SIDE):
		("shpuld move side")
		velocity = direction_2 * SPEED * ACCELERATION
		move_and_slide()
		if is_on_wall():
			change_direction_side()
		
func change_direction():
	if direction == Vector2.UP:
		direction = Vector2.DOWN
	else: 
		direction = Vector2.UP

func change_direction_side():
	if direction_2 == Vector2.LEFT:
		direction_2 = Vector2.RIGHT
	else: 
		direction_2 = Vector2.LEFT
