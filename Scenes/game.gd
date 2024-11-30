extends Node2D

const DUMMY_LEVEL = preload("res://Scenes/Levels/DummyLevel.tscn")
const LEVEL_1 = preload("res://Scenes/Levels/level_1.tscn")
const LEVEL_2 = preload("res://Scenes/Levels/level_2.tscn")
const LEVEL_3 = preload("res://Scenes/Levels/level_3.tscn")
const LEVEL_4 = preload("res://Scenes/Levels/level_4.tscn")
const LEVEL_5 = preload("res://Scenes/Levels/level_5.tscn")
const LEVEL_6 = preload("res://Scenes/Levels/level_6.tscn")
const LEVEL_7 = preload("res://Scenes/Levels/level_7.tscn")
const LEVEL_8 = preload("res://Scenes/Levels/level_8.tscn")
const LEVEL_9 = preload("res://Scenes/Levels/level_9.tscn")
const LEVEL_10 = preload("res://Scenes/Levels/level_10.tscn")
const LEVEL_11 = preload("res://Scenes/Levels/level_11.tscn")
const LEVEL_12 = preload("res://Scenes/Levels/level_12.tscn")
const LEVEL_13 = preload("res://Scenes/Levels/level_13.tscn")

@onready var hud: Node2D = $CanvasLayer/Hud
@onready var level_changer: Control = $LevelChanger


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Globals.changing_level:
		level_changer.show()


func _on_level_changer_change_level(level) -> void:
	reset_level_logic()
	match level:
		0:
			var	dummy_level = DUMMY_LEVEL.instantiate()
			get_parent().add_child(dummy_level)
		1:
			get_parent().add_child(LEVEL_1.instantiate())
		2:
			get_parent().add_child(LEVEL_2.instantiate())
		3:
			get_parent().add_child(LEVEL_3.instantiate())
		4:
			get_parent().add_child(LEVEL_4.instantiate())
		5:
			get_parent().add_child(LEVEL_5.instantiate())
		6:
			get_parent().add_child(LEVEL_6.instantiate())
		7:
			get_parent().add_child(LEVEL_7.instantiate())
		8:
			get_parent().add_child(LEVEL_8.instantiate())
		9:
			get_parent().add_child(LEVEL_9.instantiate())
		10:
			get_parent().add_child(LEVEL_10.instantiate())			
		11:
			get_parent().add_child(LEVEL_11.instantiate())			
		12:
			get_parent().add_child(LEVEL_12.instantiate())
		13:
			get_parent().add_child(LEVEL_13.instantiate())


func reset_level_logic():
	hud.visible = true
	level_changer.hide()
	Globals.changing_level = false
	Globals.ready_to_evacuate = false
