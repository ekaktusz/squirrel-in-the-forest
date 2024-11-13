extends Node2D

@onready var squirrel: CharacterBody2D = $Squirrel
@onready var starting_position: Node2D = $StartEnd

func _on_squirrel_enemy_hit() -> void:
	squirrel.position = starting_position.position


func _on_squirrel_level_done() -> void:
	Globals.changing_level = true
	queue_free()
