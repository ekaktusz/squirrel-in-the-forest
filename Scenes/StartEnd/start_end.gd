extends Node2D
@onready var evacuate_label: Label = $EvacuateLabel

func _on_area_2d_area_entered(area: Area2D) -> void:
	Globals.in_start_area = true
	if area.is_in_group("player") and Globals.ready_to_evacuate:
		evacuate_label.show()
		
func _on_area_2d_area_exited(_area: Area2D) -> void:
	evacuate_label.hide()
	Globals.in_start_area = false
