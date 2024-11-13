extends CharacterBody2D
@onready var squirrel: CharacterBody2D = $"."
@onready var sprite_collision: CollisionShape2D = $SpriteCollision
@onready var area_collision: CollisionShape2D = $Area2D/AreaCollision
@onready var power_up_speed_timer: Timer = $PowerUpSpeedTimer
@onready var progress_bar: ProgressBar = $ProgressBar

signal enemy_hit

func _input(event):
	if (event.is_action_pressed("power_up_speed") && Globals.power_up_speed_available):
		power_up_speed_timer.start()
		progress_bar.visible = true
		progress_bar.value = 100
		var tween = get_tree().create_tween()
		tween.tween_property(progress_bar,"value",0,2.0)
		Globals.speed = Globals.speed * 2

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


func _on_power_up_speed_timer_timeout() -> void:
	progress_bar.visible = false
	Globals.speed = Globals.speed / 2
