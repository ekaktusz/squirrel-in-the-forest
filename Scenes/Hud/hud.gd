extends CanvasLayer
@onready var total_nut: Label = $TotalNut

func _process(_delta: float) -> void:
	total_nut.text = "Total Nut counter: " + str(Globals.total_nut_counter)
