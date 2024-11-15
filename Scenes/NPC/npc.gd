extends CharacterBody2D

@onready var npc: CharacterBody2D = $"."
@export var style : int
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 60
const ACCELERATION = 2
var direction: Vector2 = Vector2.UP
var direction_2: Vector2 = Vector2.LEFT
		
func _process(_delta):
	if (style == Globals.NpcType.UP_DOWN):
		velocity = direction * SPEED * ACCELERATION
		move_and_slide()
		#if is_on_ceiling() or is_on_floor():
			#change_direction()
	elif (style == Globals.NpcType.SIDE_TO_SIDE):
		velocity = direction_2 * SPEED * ACCELERATION
		move_and_slide()
		#if is_on_wall():
			#change_direction_side()
	elif (style == Globals.NpcType.STATIC):
		animated_sprite_2d.play("blue_idle")
func change_direction():
	if direction == Vector2.UP:
		direction = Vector2.DOWN
		animated_sprite_2d.play("blue_down")
	else: 
		direction = Vector2.UP
		animated_sprite_2d.play("blue_up")

func change_direction_side():
	if direction_2 == Vector2.LEFT:
		direction_2 = Vector2.RIGHT
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play("blue_run")
	else: 
		direction_2 = Vector2.LEFT
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("blue_run")
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (style == Globals.NpcType.SIDE_TO_SIDE):
		change_direction_side()
	elif (style == Globals.NpcType.UP_DOWN):
		change_direction()
