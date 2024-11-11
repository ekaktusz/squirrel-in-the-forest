extends CharacterBody2D
@onready var squirrel: CharacterBody2D = $"."
@onready var sprite_collision: CollisionShape2D = $SpriteCollision
@onready var area_collision: CollisionShape2D = $Area2D/AreaCollision



signal enemy_hit

func _physics_process(_delta: float) -> void:
	
	#todo maybe good idea to add state manager if a lot of states come up
	#current states: moving, hiding, possible states later: jumping, dashing, fighting 
	if (Globals.hiding):
		sprite_collision.disabled = true
		area_collision.disabled = true
		squirrel.visible = false
	else: 
		sprite_collision.disabled = false
		area_collision.disabled = false
		squirrel.visible = true
			
	if (Input.is_action_just_pressed("hide") && Globals.able_to_hide):
		print("hiding")
		Globals.hiding = true
	if (Input.is_action_just_released("hide")):
		print("stopped hiding")
		Globals.hiding = false
		
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		velocity = velocity.move_toward(direction * Globals.speed, Globals.acceleration)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, Globals.friction)
	if (!Globals.hiding):
		move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		Globals.lose_nut()
		enemy_hit.emit()
	if area.is_in_group("nut"):
		Globals.collect_nut()
