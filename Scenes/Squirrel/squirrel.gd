extends CharacterBody2D
@onready var squirrel: CharacterBody2D = $"."
@onready var sprite_collision: CollisionShape2D = $SpriteCollision
@onready var area_collision: CollisionShape2D = $Area2D/AreaCollision
@onready var power_up_speed_timer: Timer = $PowerUpSpeedTimer
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var enter_timer: Timer = $EnterTimer

var exit_enter_in_progress = true

signal enemy_hit
signal level_done

func _ready() -> void:
	await get_tree().create_timer(2.2).timeout
	exit_enter_in_progress = false
	

func _input(event):
	if (!exit_enter_in_progress && event.is_action_pressed("power_up_speed") && Globals.power_up_speed_available):
		power_up_speed_timer.start()
		Globals.power_up_speed_available = false
		progress_bar.visible = true
		progress_bar.value = 100
		var tween = get_tree().create_tween()
		tween.tween_property(progress_bar,"value",0,2.0)
		Globals.speed = Globals.speed * 2

func _physics_process(_delta: float) -> void:
	
	#todo maybe good idea to add state manager if a lot of states come up
	#current states: moving, hiding, possible states later: jumping, dashing, fighting 
	if (!exit_enter_in_progress):
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
			
		if (Input.is_action_just_pressed("evacuate") && Globals.ready_to_evacuate && Globals.in_start_area):
			exit_enter_in_progress = true
			animated_sprite_2d.play("evacuate")
			sprite_collision.disabled = true
			area_collision.disabled = true
			await get_tree().create_timer(2.2).timeout
			level_done.emit()
			
		var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		if direction:
			match direction:
				Vector2.UP:
					animated_sprite_2d.play("run_up")
				Vector2.DOWN:
					animated_sprite_2d.play("run_down")
				Vector2.RIGHT:
					animated_sprite_2d.flip_h = false
					animated_sprite_2d.play("run")
				Vector2.LEFT:
					animated_sprite_2d.flip_h = true
					animated_sprite_2d.play("run")
					
				
			velocity = velocity.move_toward(direction * Globals.speed, Globals.acceleration)
		else:
			velocity = velocity.move_toward(Vector2.ZERO, Globals.friction)
			if (!exit_enter_in_progress):
				animated_sprite_2d.play("idle")
		if (!Globals.hiding):
			move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		Globals.lose_nut()
		enemy_hit.emit()
	if area.is_in_group("nut"):
		Globals.collect_nut()

func _on_power_up_speed_timer_timeout() -> void:
	Globals.power_up_speed_available = true
	progress_bar.visible = false
	Globals.speed = Globals.speed / 2
