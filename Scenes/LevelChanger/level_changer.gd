extends Control
@onready var power_up_shop: Node2D = $PowerUpShop

signal change_level

func _on_dummy_level_pressed() -> void:
	change_level.emit(0)


func _on_level_1_pressed() -> void:
	change_level.emit(1)


func _on_shop_button_pressed() -> void:
	power_up_shop.visible = !power_up_shop.visible


func _on_level_4_pressed() -> void:
	change_level.emit(4)


func _on_level_7_pressed() -> void:
	change_level.emit(7)


func _on_level_6_pressed() -> void:
	change_level.emit(6)


func _on_level_5_pressed() -> void:
	change_level.emit(5)


func _on_level_3_pressed() -> void:
	change_level.emit(3)


func _on_level_2_pressed() -> void:
	change_level.emit(2)
