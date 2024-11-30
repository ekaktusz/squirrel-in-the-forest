extends Control

@export var max_offset: Vector2 = Vector2(10, 10)
@export var smoothing: float = 20.0

@onready var grid_container: GridContainer = $GridContainer
var initial_position: Vector2

func _ready() -> void:
	# Save the grid_container's initial position
	initial_position = grid_container.position

	# Iterate through all child nodes of the LevelSelector
	for child in grid_container.get_children():
		if child is Button:  # Check if the child is a Button
			child.connect("level_pressed", _on_level_button_pressed)

# Common handler for all buttons
func _on_level_button_pressed(level_number: int) -> void:
	Globals.current_level_number = level_number
	SceneTransition.change_scene("res://Scenes/LevelIntro/level_intro.tscn")

func _process(delta: float) -> void:
	var center: Vector2 = get_viewport_rect().size / 2.0
	var dist: Vector2 = get_global_mouse_position() - center
	var offset: Vector2 = dist / center

	# Calculate the new position based on the initial position
	var new_pos: Vector2 = initial_position + Vector2(
		lerp(-max_offset.x, max_offset.x, offset.x),
		lerp(-max_offset.y, max_offset.y, offset.y)
	)
	
	grid_container.position.x = lerp(grid_container.position.x, new_pos.x, smoothing * delta)
	grid_container.position.y = lerp(grid_container.position.y, new_pos.y, smoothing * delta)
