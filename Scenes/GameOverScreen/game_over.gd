extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	Globals.current_level_number = 0
	Globals.total_nut_counter = 0
	Globals.current_level_no_of_nuts = 0
	Globals.current_level_collected_nuts = 0
	Globals.remaining_life = 0
	Globals.selected_power_up = Globals.RelicType.None
	Globals.power_up_used = false
	Globals.speed_power_up_percentage = 1.5
	Globals.invis_power_up_time = 1
	Globals.hiding = false
	Globals.able_to_hide = false
	Globals.ready_to_evacuate = false
	Globals.in_start_area = false
	SceneTransition.change_scene("res://Scenes/LevelSelector/level_selector.tscn")
	pass # Replace with function body.
