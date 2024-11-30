extends Node2D

var hud = preload("res://Scenes/Hud/Hud.tscn")

@onready var squirrel: CharacterBody2D = $Squirrel
@onready var starting_position: Node2D = $StartEnd

@onready var camera: Camera2D = $Squirrel/Camera2D  # Adjust the path as needed
@onready var map: TileMapLayer = $TilemapFirstFloor  # Adjust the path to your TileMap node

@export var nut_number_on_level: int
var level_nut_counter: int = 0

func _ready() -> void:
	#_set_camera_limits()
	add_child(hud.instantiate())

func _process(_delta) -> void:
	if (level_nut_counter >= nut_number_on_level):
		Globals.ready_to_evacuate = true


func _set_camera_limits() -> void:
	var map_cellsize = map.tile_set.tile_size
	var level_size_px = map.get_used_rect().size.x * map_cellsize.x

	camera.limit_top = -level_size_px
	camera.limit_right = level_size_px
	camera.limit_bottom = level_size_px
	camera.limit_left = -level_size_px 


func _on_squirrel_enemy_hit() -> void:
	squirrel.position = starting_position.position

func _on_squirrel_level_done() -> void:
	Globals.current_level_number += 1
	SceneTransition.change_scene("res://Scenes/LevelIntro/level_intro.tscn")

func _on_squirrel_nut_collected() -> void:
	level_nut_counter = level_nut_counter+1
