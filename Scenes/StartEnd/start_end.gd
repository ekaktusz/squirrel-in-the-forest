extends Node2D
@onready var evacuate_label: Label = $EvacuateLabel

signal evacuate

var in_start_area: bool = false

func _input(event):
	if event.is_action_pressed("evacuate") &&  Globals.ready_to_evacuate && in_start_area:
		print("evacuate pressed")
		evacuate.emit()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if (area.is_in_group("player") && Globals.ready_to_evacuate):
		evacuate_label.show()
		in_start_area = true
		

func _on_area_2d_area_exited(area: Area2D) -> void:
	evacuate_label.hide()
	in_start_area = false
