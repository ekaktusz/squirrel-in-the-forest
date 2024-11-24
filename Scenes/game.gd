extends Node2D

const levels = {
	0: preload("res://Scenes/Levels/level_0.tscn"),
	1: preload("res://Scenes/Levels/level_1.tscn")
}

@onready var hud: Node2D = $CanvasLayer/Hud
@onready var level_changer: Control = $LevelChanger

@onready var s_material: ShaderMaterial = $Background.material as ShaderMaterial

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Globals.changing_level:
		level_changer.show()
	# Get mouse position in the viewport
	var mouse_pos = get_viewport().get_mouse_position()
	var viewport_size = get_viewport().size
	# Normalize mouse position to a range of 0.0 to 1.0
	var normalized_mouse_pos = Vector2(mouse_pos) / Vector2(viewport_size)
	# Pass normalized mouse position to the shader
	s_material.set_shader_parameter("mouse_position", normalized_mouse_pos)


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
	Globals.changing_level = false
	Globals.level_nut_counter = 0
	Globals.ready_to_evacuate = false
	
