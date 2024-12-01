extends Control

@onready var tool_tip: Control = $ToolTip
@onready var texture_rect: TextureRect = $TextureRect
@onready var selected_rect: TextureRect = $SelectedRect

@export var type: Globals.RelicType = Globals.RelicType.Invisibility
var selected: bool = false  # Flag to track if this relic is selected

const relic_descriptions =  {
	Globals.RelicType.Speed: "Gotta go FASTER!",
	Globals.RelicType.Invisibility: "Enemies will not see you.",
	Globals.RelicType.Shield: "Saves you from lethal damage.",
	Globals.RelicType.Reveal: "X-Ray vision v2000!"
}

var relic_textures = {
	Globals.RelicType.Speed: preload("res://Scenes/LevelIntro/Relics/gadget_speed.png"),
	Globals.RelicType.Invisibility: preload("res://Scenes/LevelIntro/Relics/gadget_invisibility.png"),
	Globals.RelicType.Shield: preload("res://Scenes/LevelIntro/Relics/gadget_armour.png"),
	Globals.RelicType.Reveal: preload("res://Scenes/LevelIntro/Relics/gadget_samfisher.png"),
	Globals.RelicType.None: TextureRect.new()
}

func _ready() -> void:
	texture_rect.set_texture(relic_textures[type])
	_update_modulate()  # Set the initial modulation state

func set_type(type: Globals.RelicType) -> void:
	self.type = type
	texture_rect.set_texture(relic_textures[type])

func get_description() -> String:
	return relic_descriptions[type]

func _on_mouse_entered() -> void:
	if not selected:
		_make_bright()

func _on_mouse_exited() -> void:
	if not selected:
		_make_darker()

func _make_darker() -> void:
	# Modulate to make the texture darker
	texture_rect.modulate = Color(0.5, 0.5, 0.5, 1)  # Darker by reducing RGB values

func _make_bright() -> void:
	# Modulate to restore original brightness
	texture_rect.modulate = Color(1, 1, 1, 1)  # Full brightness

func select() -> void:
	selected = true
	selected_rect.visible = true
	_make_bright()  # Ensure it stays bright when selected

func unselect() -> void:
	selected = false
	selected_rect.visible = false
	_make_darker()  # Return to darker unless the mouse is still hovering

func _update_modulate() -> void:
	if selected:
		_make_bright()
	else:
		_make_darker()
