extends CanvasLayer
@onready var total_nut: Label = $TotalNut
@onready var level_progress: Label = $LevelProgress


func _process(_delta: float) -> void:
	total_nut.text = "Nuts collected: " + str(Globals.total_nut_counter)
	level_progress.text = "Nuts on level: " + str(Globals.current_level_collected_nuts) + "/" + str(Globals.current_level_no_of_nuts)
