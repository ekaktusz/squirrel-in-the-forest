extends CharacterBody2D

@onready var npc: CharacterBody2D = $"."
@onready var navigation_agent_2d: NavigationAgent2D = $"../NavigationAgent2D"

const SPEED = 30
const ACCELERATION = 1
var direction: Vector2 = Vector2.UP
var direction_2: Vector2 = Vector2.LEFT
	
func move():
	velocity = direction * SPEED * ACCELERATION
	move_and_slide()
	if is_on_ceiling() or is_on_floor():
		change_direction()
		
func change_direction():
	if direction == Vector2.UP:
		direction = Vector2.DOWN
	else: 
		direction = Vector2.UP

func move_side():
	velocity = direction_2 * SPEED * ACCELERATION
	move_and_slide()
	print(is_on_wall())
	if is_on_wall():
		change_direction_side()

func change_direction_side():
	if direction_2 == Vector2.LEFT:
		direction_2 = Vector2.RIGHT
	else: 
		direction_2 = Vector2.LEFT
