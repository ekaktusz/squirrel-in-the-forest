extends Control

signal change_level

func _on_dummy_level_pressed() -> void:
	change_level.emit(0)


func _on_level_1_pressed() -> void:
		change_level.emit(1)
