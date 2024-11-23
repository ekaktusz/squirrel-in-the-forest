extends Control

signal change_level(level_number: int)

func _ready() -> void:
	# Iterate through all child nodes of the LevelSelector
	for child in get_children():
		if child is Button:  # Check if the child is a Button
			child.connect("level_pressed", _on_level_button_pressed)

# Common handler for all buttons
func _on_level_button_pressed(level_number: int) -> void:
	change_level.emit(level_number)
