@tool

extends Button

@export var level_number: int = 1

signal level_pressed(level_number: int)

func _ready() -> void:
	text = "LEVEL " + str(level_number)
	
func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		text = "LEVEL " + str(level_number)

func _on_pressed() -> void:
	level_pressed.emit(level_number)
