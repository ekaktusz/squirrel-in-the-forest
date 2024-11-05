extends Node2D

@onready var npc: CharacterBody2D = $NPC
@onready var npc_2: CharacterBody2D = $NPC2

func _process(_delta: float) -> void:
	npc.move()
	npc_2.move_side()
