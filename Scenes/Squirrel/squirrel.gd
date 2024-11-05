extends CharacterBody2D


const SPEED = 50
const ACCELERATION = 25
const FRICTION = 10

func _physics_process(_delta: float) -> void:
	
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	move_and_slide()
