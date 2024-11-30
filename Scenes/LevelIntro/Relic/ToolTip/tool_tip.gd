extends Control

@onready var rich_text_label: RichTextLabel = $MarginContainer/RichTextLabel


func _process(delta):
	# Adjust the tooltip position slightly so it doesn't overlap the mouse
	position = get_global_mouse_position() + Vector2(10, 10)

func set_text(text: String):
	rich_text_label.text = text
