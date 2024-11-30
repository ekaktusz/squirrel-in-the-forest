extends CharacterBody2D

@export var style : Globals.NpcType
@export var color : Globals.NpcColor
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 15
const ACCELERATION = 2
var direction: Vector2 = Vector2.UP
var direction_2: Vector2 = Vector2.LEFT

func _ready() -> void:
	_play_idle_anim()
	
	
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
		_play_action_anim("idle")
		
		
func change_direction():
	if direction == Vector2.UP:
		direction = Vector2.DOWN
		_play_action_anim("down")
	else: 
		direction = Vector2.UP
		_play_action_anim("up")


func change_direction_side():
	if direction_2 == Vector2.LEFT:
		direction_2 = Vector2.RIGHT
		animated_sprite_2d.flip_h = false
	else: 
		direction_2 = Vector2.LEFT
		animated_sprite_2d.flip_h = true
	_play_action_anim("run")
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (style == Globals.NpcType.SIDE_TO_SIDE):
		change_direction_side()
	elif (style == Globals.NpcType.UP_DOWN):
		change_direction()
		
		
func _play_action_anim(action : String) -> void:
	match color:
		Globals.NpcColor.BLUE:
			animated_sprite_2d.play("blue" + "_" + action)
		Globals.NpcColor.WHITE:
			animated_sprite_2d.play("white" + "_" + action)
		Globals.NpcColor.RED:
			animated_sprite_2d.play("red" + "_" + action)


func _play_idle_anim() -> void:
	match color:
		Globals.NpcColor.BLUE:
			animated_sprite_2d.play("blue_idle")
		Globals.NpcColor.WHITE:
			animated_sprite_2d.play("white_idle")
		Globals.NpcColor.RED:
			animated_sprite_2d.play("red_idle")
