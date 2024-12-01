extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var sfx: AudioStreamPlayer2D = $SFX

func _ready() -> void:
	if (Globals.selected_power_up == Globals.RelicType.Reveal):
		z_index = 100
		animated_sprite_2d.modulate = Color(Color.GREEN)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		animated_sprite_2d.play("pickup")
		if (!sfx.playing):
			sfx.play()
		await animated_sprite_2d.animation_finished
		queue_free()
