extends Node2D

@onready var squirrel: CharacterBody2D = $Squirrel
@onready var starting_position: Node2D = $StartEnd

@export var nut_number_on_level: int
var level_nut_counter: int = 0

func _process(_delta) -> void:
	if (level_nut_counter >= nut_number_on_level):
		Globals.ready_to_evacuate = true

func _on_squirrel_enemy_hit() -> void:
	squirrel.position = starting_position.position


func _on_squirrel_level_done() -> void:
	Globals.changing_level = true
	queue_free()


func _on_squirrel_nut_collected() -> void:
	level_nut_counter = level_nut_counter+1
