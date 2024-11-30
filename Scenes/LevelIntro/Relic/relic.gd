extends Control

@onready var tool_tip: Control = $ToolTip
@onready var texture_rect: TextureRect = $TextureRect

@export var type: Globals.RelicType = Globals.RelicType.Invisibility

const relic_descriptions =  {
	Globals.RelicType.Speed: "SPEEEEEEEED power lets goooo baby i love speed ",
	Globals.RelicType.Invisibility: "not even your mom can see u bro, hidehide",
	Globals.RelicType.Shield: "protect you from serious injuries (from ur mom)",
	Globals.RelicType.Reveal: "x ray vision nuts edition v2000 beast mode"
}

const relic_textures = {
	Globals.RelicType.Speed: preload("res://Scenes/LevelIntro/Relics/gadget_speed.png"),
	Globals.RelicType.Invisibility: preload("res://Scenes/LevelIntro/Relics/gadget_invisibility.png"),
	Globals.RelicType.Shield: preload("res://Scenes/LevelIntro/Relics/gadget_armour.png"),
	Globals.RelicType.Reveal: preload("res://Scenes/LevelIntro/Relics/gadget_samfisher.png")
}

func _ready() -> void:
	texture_rect.set_texture(relic_textures[type])
	_make_darker()  # Default state is darker

func set_type(type: Globals.RelicType) -> void:
	self.type = type
	texture_rect.set_texture(relic_textures[type])

func get_description() -> String:
	return relic_descriptions[type]

func _on_mouse_entered() -> void:
	_make_bright()

func _on_mouse_exited() -> void:
	_make_darker() # Replace with function body.

func _make_darker() -> void:
	# Modulate to make the texture darker (adjust to your preference)
	texture_rect.modulate = Color(0.5, 0.5, 0.5, 1)  # Darker by reducing RGB values

func _make_bright() -> void:
	# Modulate to restore original brightness
	texture_rect.modulate = Color(1, 1, 1, 1)  # Full brightness
