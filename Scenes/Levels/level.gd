extends Node2D

var hud = preload("res://Scenes/Hud/hud.tscn")

@onready var squirrel: CharacterBody2D = $Squirrel
@onready var starting_position: Node2D = $StartEnd

@onready var camera: Camera2D = $Squirrel/Camera2D  # Adjust the path as needed
@onready var map: TileMapLayer = $TilemapFirstFloor  # Adjust the path to your TileMap node

@export var nut_number_on_level: int
var level_nut_counter: int = 0

func _ready() -> void:
	_set_camera_limits()
	add_child(hud.instantiate())

func _process(_delta) -> void:
	if (level_nut_counter >= nut_number_on_level):
		Globals.ready_to_evacuate = true
		
func _set_camera_limits() -> void:
	var map_limits = map.get_used_rect()
	var map_cellsize = map.tile_set.tile_size
	camera.limit_left = (map_limits.position.x + 1) * map_cellsize.x
	camera.limit_right = map_limits.end.x * map_cellsize.x
	camera.limit_top = map_limits.position.y * map_cellsize.y
	camera.limit_bottom = (map_limits.end.y - 1) * map_cellsize.y
	
func _on_squirrel_enemy_hit() -> void:
	squirrel.position = starting_position.position

func _on_squirrel_level_done() -> void:
	SceneTransition.change_scene("res://Scenes/LevelSelector/level_selector.tscn")

func _on_squirrel_nut_collected() -> void:
	level_nut_counter = level_nut_counter+1
