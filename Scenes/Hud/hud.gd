extends Node2D
@onready var label: Label = $Label

func _process(delta: float) -> void:
	label.text = "Nut counter: " + str(Globals.nut_counter)
