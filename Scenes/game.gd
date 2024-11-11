extends Node2D

const DUMMY_LEVEL = preload("res://Scenes/Levels/DummyLevel.tscn")
const LEVEL_1 = preload("res://Scenes/Levels/Level_1.tscn")
@onready var hud: Node2D = $CanvasLayer/Hud


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_level_changer_change_level(level) -> void:
	match level:
		0:
			var	dummy_level = DUMMY_LEVEL.instantiate()
			hud.visible = true
			reset_level_logic()
			get_parent().add_child(dummy_level)
		1:
			var	level_1 = LEVEL_1.instantiate()
			hud.visible = true
			reset_level_logic()
			get_parent().add_child(level_1)

func reset_level_logic():
	Globals.level_nut_counter = 0
	Globals.ready_to_evacuate = false
