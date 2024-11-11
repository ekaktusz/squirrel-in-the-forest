extends Node2D

@onready var npc: CharacterBody2D = $NPC
@onready var npc_2: CharacterBody2D = $NPC2
@onready var squirrel: CharacterBody2D = $Squirrel
@onready var starting_position: Node2D = $StartingPosition

func _on_squirrel_enemy_hit() -> void:
	squirrel.position = starting_position.position
