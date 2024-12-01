extends Node2D

const relic_textures = {
	Globals.RelicType.Speed: preload("res://Scenes/LevelIntro/Relics/gadget_speed.png"),
	Globals.RelicType.Invisibility: preload("res://Scenes/LevelIntro/Relics/gadget_invisibility.png"),
	Globals.RelicType.Shield: preload("res://Scenes/LevelIntro/Relics/gadget_armour.png"),
	Globals.RelicType.Reveal: preload("res://Scenes/LevelIntro/Relics/gadget_samfisher.png")
}

@onready var texture_rect: TextureRect = $TextureRect


func _ready() -> void:
	texture_rect.set_texture(relic_textures[Globals.selected_power_up])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
