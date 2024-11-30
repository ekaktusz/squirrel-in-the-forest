extends Control

@onready var tool_tip: Control = $ToolTip
@onready var texture_rect: TextureRect = $TextureRect

enum RelicType {Speed, Invisibility, Shield, Reveal}

@export var type: RelicType = RelicType.Invisibility

const relic_descriptions =  {
	RelicType.Speed: "SPEEEEEEEED power lets goooo baby",
	RelicType.Invisibility: "not even your mom can see u bro",
	RelicType.Shield: "protect you from serious injuries",
	RelicType.Reveal: "wanna see nuts everywhere? take it"
}

const relic_textures = {
	RelicType.Speed: preload("res://Scenes/LevelIntro/Relics/gadget_speed.png"),
	RelicType.Invisibility: preload("res://Scenes/LevelIntro/Relics/gadget_invisibility.png"),
	RelicType.Shield: preload("res://Scenes/LevelIntro/Relics/gadget_armour.png"),
	RelicType.Reveal: preload("res://Scenes/LevelIntro/Relics/gadget_samfisher.png")
}

func _ready() -> void:
	texture_rect.set_texture(relic_textures[type])
	tool_tip.set_text(relic_descriptions[type])
	tool_tip.hide()
	
var is_mouse_inside_texture = false

func _on_texture_rect_mouse_entered() -> void:
	is_mouse_inside_texture = true
	tool_tip.show()

func _on_texture_rect_mouse_exited() -> void:
	# Only hide if the mouse is not over the tooltip
	is_mouse_inside_texture = false
	call_deferred("hide_tooltip")


func hide_tooltip():
	if not is_mouse_inside_texture:
		tool_tip.hide()



	
