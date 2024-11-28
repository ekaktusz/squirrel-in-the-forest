extends Node2D

const levels = {
	0: preload("res://Scenes/Levels/level_0.tscn"),
	1: preload("res://Scenes/Levels/level_1.tscn")
}

@onready var hud: Node2D = $CanvasLayer/Hud
@onready var level_changer: Control = $LevelChanger

func _on_level_changer_change_level(level) -> void:
	if levels.has(level): 
		reset_level_logic()
		var new_level = levels[level].instantiate()
		get_parent().add_child(new_level)
	else:
		print("Level not found: " + str(level))

func reset_level_logic():
	hud.visible = true
	level_changer.hide()
	Globals.ready_to_evacuate = false
	
