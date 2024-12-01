extends Node2D

@export var style = Globals.HideawayStyle.TREE
@onready var sprite = $Sprite2D
@onready var label = $HideLabel

var is_squirrel_in_range = false
var is_occupied = false
var hide_animation


# -> HideawayStyle {TREE, SAFE, PUDDLE, BUSH, MURAL, WATERTOWER, HACIENDA}
var StyleToAnimationMap = ["tree", "safe", "puddle", "bush", "mural", "watertower", "hacienda garden"]


func _ready() -> void:
	sprite.play(StyleToAnimationMap[style])
	sprite.stop()
	if (style == 0 ):
		sprite.position = Vector2(sprite.position.x - 16, sprite.position.y)
	
	
func _process(_delta: float) -> void:
	if(is_squirrel_in_range):
		if !is_occupied and Globals.hiding:
			sprite.play(StyleToAnimationMap[style])
			is_occupied = true
		elif is_occupied and !Globals.hiding:
			is_occupied = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		is_squirrel_in_range = true
		Globals.able_to_hide = true
		label.visible = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		Globals.able_to_hide = false
		is_squirrel_in_range = false
		label.visible = false
