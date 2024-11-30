extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_speed_buy_button_pressed() -> void:
	print("speed_buy_button_pressed")


func _on_invisibility_buy_button_pressed() -> void:
	print("invisibility_buy_button_pressed")


func _on_start_button_pressed() -> void:
	SceneTransition.change_scene("res://Scenes/Levels/level_" + str(Globals.current_level_number) + ".tscn")
