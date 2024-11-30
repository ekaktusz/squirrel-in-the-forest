extends Node2D

@onready var sprite = $Sprite2D

var is_squirrel_in_range = false
var is_occupied = false


func _process(_delta: float) -> void:
	if(is_squirrel_in_range):
		if !is_occupied and Globals.hiding:
			sprite.play("hide")
			is_occupied = true
		elif is_occupied and !Globals.hiding:
			sprite.play("hide")
			is_occupied = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		is_squirrel_in_range = true
		Globals.able_to_hide = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		Globals.able_to_hide = false
		is_squirrel_in_range = false
