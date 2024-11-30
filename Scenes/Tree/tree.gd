extends Node2D


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		Globals.able_to_hide = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		Globals.able_to_hide = false