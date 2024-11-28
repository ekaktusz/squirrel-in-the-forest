@tool

extends Button

@export var level_number: int = 1
const zoom_scale: float = 1.2  # Scale factor for the zoom effect
const animation_duration: float = 0.2  # Duration of the zoom animation
const hover_z_index: int = 10  # Z-index for hovered button
const normal_z_index: int = 0  # Default z-index for non-hovered button

signal level_pressed(level_number: int)

func _ready() -> void:
	text = "LEVEL " + str(level_number)
	pivot_offset = get_size() / 2  # Set pivot to the center of the button
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)

func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		text = "LEVEL " + str(level_number)

func _on_pressed() -> void:
	level_pressed.emit(level_number)

func _on_mouse_entered() -> void:
	z_index = hover_z_index  # Bring to front
	animate_scale(Vector2(zoom_scale, zoom_scale))

func _on_mouse_exited() -> void:
	z_index = normal_z_index  # Reset to default
	animate_scale(Vector2(1, 1))  # Reset to original scale

func animate_scale(target_scale: Vector2) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", target_scale, animation_duration).set_ease(Tween.EaseType.EASE_OUT).set_trans(Tween.TransitionType.TRANS_CUBIC)
