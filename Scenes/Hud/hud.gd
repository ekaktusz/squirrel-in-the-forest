extends Node2D
@onready var total_nut: Label = $TotalNut

func _process(delta: float) -> void:
	total_nut.text = "Total Nut counter: " + str(Globals.total_nut_counter)
