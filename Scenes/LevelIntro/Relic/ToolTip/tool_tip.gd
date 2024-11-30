extends Control

@onready var rich_text_label: RichTextLabel = $MarginContainer/RichTextLabel

func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE

func _process(delta):
	# Adjust the tooltip position relative to the relic's global position
	var global_mouse_position = get_global_mouse_position()
	var parent_global_position = get_parent().get_global_transform().origin
	position = global_mouse_position - parent_global_position + Vector2(10, 10)
	#print(position)  # Debug position

func set_text(text: String):
	rich_text_label.text = text
