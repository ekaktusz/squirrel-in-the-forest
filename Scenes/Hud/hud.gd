extends CanvasLayer
@onready var total_nut: Label = $TotalNut

func _process(_delta: float) -> void:
	total_nut.text = "Nuts collected: " + str(Globals.total_nut_counter)
