extends Node2D

@onready var squirrel: CharacterBody2D = $Squirrel
@onready var starting_position: Node2D = $StartEnd

@onready var camera: Camera2D = $Squirrel/Camera2D  # Adjust the path as needed
@onready var map: TileMapLayer = $TilemapFirstFloor  # Adjust the path to your TileMap node

@export var nut_number_on_level: int
var level_nut_counter: int = 0

func _ready() -> void:
	_set_camera_limits()

func _process(_delta) -> void:
	if (level_nut_counter >= nut_number_on_level):
		Globals.ready_to_evacuate = true
		
func _set_camera_limits() -> void:
	if map == null:
		print("TileMap not found!")
		return
		
	# Get the map's boundaries
	var map_bounds = map.get_used_rect()
	var tile_size = map.tile_set.tile_size
	
	# Get viewport size and camera zoom
	var viewport_size = get_viewport_rect().size
	var camera_zoom = camera.zoom
	
	# Convert to world coordinates
	var min_pos = (map_bounds.position + Vector2i(1, 0)) * tile_size
	var max_pos = (map_bounds.position - Vector2i(0, 1) + map_bounds.size) * tile_size
	
	# Set the camera limits, accounting for viewport size and zoom
	camera.limit_left = int(min_pos.x)
	camera.limit_top = int(min_pos.y)
	camera.limit_right = int(max_pos.x)
	camera.limit_bottom = int(max_pos.y)
	
	# Debugging outputs
	print("Map Bounds: ", map_bounds)
	print("Camera Limits:")
	print("Left: ", camera.limit_left, ", Right: ", camera.limit_right)
	print("Top: ", camera.limit_top, ", Bottom: ", camera.limit_bottom)
	
func _on_squirrel_enemy_hit() -> void:
	squirrel.position = starting_position.position


func _on_squirrel_level_done() -> void:
	Globals.changing_level = true
	queue_free()


func _on_squirrel_nut_collected() -> void:
	level_nut_counter = level_nut_counter+1
