extends Node2D
@onready var level_nut: Label = $LevelNut
@onready var total_nut: Label = $TotalNut

func _process(delta: float) -> void:
	level_nut.text = "Level Nut counter: " + str(Globals.level_nut_counter)
	total_nut.text = "Total Nut counter: " + str(Globals.total_nut_counter)
