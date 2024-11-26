extends Node2D

const DUMMY_LEVEL = preload("res://Scenes/Levels/DummyLevel.tscn")
const LEVEL_1 = preload("res://Scenes/Levels/Level_1.tscn")
const LEVEL_2 = preload("res://Scenes/Levels/Level_2.tscn")

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
			var	level_1 = LEVEL_1.instantiate()
			get_parent().add_child(level_1)
			
		2:
			get_parent().add_child(LEVEL_2.instantiate())

func reset_level_logic():
	hud.visible = true
	level_changer.hide()
	Globals.changing_level = false
	Globals.ready_to_evacuate = false
