extends CharacterBody2D

@onready var squirrel: CharacterBody2D = self
@onready var sprite_collision: CollisionShape2D = $SpriteCollision
@onready var area_collision: CollisionShape2D = $Area2D/AreaCollision
@onready var power_up_speed_timer: Timer = $PowerUpSpeedTimer
@onready var power_up_invisible_timer: Timer = $PowerUpInvisibleTimer
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var area_2d: Area2D = $Area2D

signal enemy_hit
signal level_done
signal nut_collected

var state: Globals.SquirrelState = Globals.SquirrelState.NORMAL
var exit_enter_in_progress: bool = true

var speed: int = 150
const acceleration: int = 50
const friction: int = 30

const COLLISION_LAYER_ENEMY: int = 3
const COLLISION_LAYER_PLAYER: int = 2

var enemy_state

func _ready() -> void:
	set_enemy_state(Node.PROCESS_MODE_DISABLED)
	await get_tree().create_timer(2.2).timeout
	exit_enter_in_progress = false


func _input(event):
	if exit_enter_in_progress:
		return
	
	set_enemy_state(Node.PROCESS_MODE_INHERIT)
		
	if state != Globals.SquirrelState.NORMAL:
		return
	
	if event.is_action_pressed("action"):
		match Globals.selected_power_up:
			Globals.RelicType.Speed:
				activate_power_up_speed()
			Globals.RelicType.Invisibility:
				activate_power_up_invisible()
			Globals.RelicType.Shield:
				activate_power_up_shield()
			Globals.RelicType.Reveal:
				activate_power_up_reveal()


func activate_power_up_speed():
	state = Globals.SquirrelState.SPEEDY
	speed = speed * Globals.speed_power_up_percentage
	add_power_up_progressbar(2)
	power_up_speed_timer.start()

	
func _on_power_up_speed_timer_timeout() -> void:
	progress_bar.visible = false
	state = Globals.SquirrelState.NORMAL
	speed = speed / Globals.speed_power_up_percentage
	
	
func activate_power_up_invisible():
	state = Globals.SquirrelState.INVISIBLE
	set_collision_layers(false)
	add_power_up_progressbar(Globals.invis_power_up_time)
	power_up_invisible_timer.wait_time = Globals.invis_power_up_time
	power_up_invisible_timer.start()
	
	
func _on_power_up_invisible_timer_timeout() -> void:
	progress_bar.visible = false
	state = Globals.SquirrelState.NORMAL
	set_collision_layers(true)
	
func activate_power_up_shield() -> void:
	print("implement me pls shield")
	pass

func activate_power_up_reveal() -> void:
	print("implement me pls reveal")
	pass
	
func set_collision_layers(enabled: bool):
	area_2d.set_collision_mask_value(COLLISION_LAYER_ENEMY, enabled)
	area_2d.set_collision_layer_value(COLLISION_LAYER_PLAYER, enabled)
	squirrel.set_collision_mask_value(COLLISION_LAYER_ENEMY, enabled)
	squirrel.set_collision_layer_value(COLLISION_LAYER_PLAYER, enabled)
	
	
func add_power_up_progressbar(time: float):
	progress_bar.visible = true
	progress_bar.value = 100
	var tween = get_tree().create_tween()
	tween.tween_property(progress_bar, "value", 0, time)	
		
func _physics_process(_delta: float) -> void:
	if exit_enter_in_progress:
		return
	
	handle_hiding()
	handle_evacuation()
	handle_movement()
		
		
func handle_hiding() -> void:
	sprite_collision.disabled = Globals.hiding
	area_collision.disabled = Globals.hiding
	squirrel.visible = not Globals.hiding
	
	if Input.is_action_just_pressed("hide") and Globals.able_to_hide:
		print("hiding")
		Globals.hiding = true
	if Input.is_action_just_released("hide"):
		print("stopped hiding")
		Globals.hiding = false
		
		
func handle_evacuation() -> void:
	if Input.is_action_just_pressed("action") and Globals.ready_to_evacuate and Globals.in_start_area:
		exit_enter_in_progress = true
		animated_sprite_2d.play("evacuate")
		sprite_collision.disabled = true
		area_collision.disabled = true
		await get_tree().create_timer(2.2).timeout
		level_done.emit()
		
		
func handle_movement() -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		play_movement_animation(direction)
		velocity = velocity.move_toward(direction * speed, acceleration)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction)
		if (!exit_enter_in_progress):
			match state:
				Globals.SquirrelState.NORMAL:
					animated_sprite_2d.play("idle")
				Globals.SquirrelState.SPEEDY:
					animated_sprite_2d.play("idle_speedy")
				Globals.SquirrelState.INVISIBLE:
					animated_sprite_2d.play("idle_invis")
	if (!Globals.hiding):
		move_and_slide()


func play_movement_animation(direction: Vector2) -> void:
	match state:
		Globals.SquirrelState.NORMAL:
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
		Globals.SquirrelState.SPEEDY:
			match direction:
				Vector2.UP:
					animated_sprite_2d.play("run_up_speedy")
				Vector2.DOWN:
					animated_sprite_2d.play("run_down_speedy")
				Vector2.RIGHT:
					animated_sprite_2d.flip_h = false
					animated_sprite_2d.play("run_speedy")
				Vector2.LEFT:
					animated_sprite_2d.flip_h = true
					animated_sprite_2d.play("run_speedy")	
		Globals.SquirrelState.INVISIBLE:
			match direction:
				Vector2.UP:
					animated_sprite_2d.play("run_up_invis")
				Vector2.DOWN:
					animated_sprite_2d.play("run_down_invis")
				Vector2.RIGHT:
					animated_sprite_2d.flip_h = false
					animated_sprite_2d.play("run_invis")
				Vector2.LEFT:
					animated_sprite_2d.flip_h = true
					animated_sprite_2d.play("run_invis")	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		Globals.lose_nut()
		enemy_hit.emit()
		set_enemy_state(Node.PROCESS_MODE_DISABLED)

	if area.is_in_group("nut"):
		nut_collected.emit()
		Globals.collect_nut()
	
		
func set_enemy_state(state : Node.ProcessMode):
	if(enemy_state != state):
		enemy_state = state
		for enemy in get_tree().get_nodes_in_group("enemy"):
			enemy.owner.process_mode = state
