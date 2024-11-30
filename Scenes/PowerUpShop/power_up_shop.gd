extends Node2D

@onready var nut_label: Label = $NutLabel
@onready var invis_unlock_button: Button = $Invis/InvisUnlockButton
@onready var speed_unlock_button: Button = $Speed/SpeedUnlockButton
@onready var speed_increase_button: Button = $Speed/SpeedIncreaseButton
@onready var invis_increase_button: Button = $Invis/InvisIncreaseButton

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	nut_label.text = "Collected nuts: " + str(Globals.total_nut_counter)


func _on_invis_unlock_button_pressed() -> void:
	if (Globals.total_nut_counter >= 10):
		invis_unlock_button.hide()
		invis_increase_button.show()
		Globals.power_up_invis_unlocked = true
		Globals.power_up_invis_available = true
		Globals.total_nut_counter = Globals.total_nut_counter - 10


func _on_speed_unlock_button_pressed() -> void:
	if (Globals.total_nut_counter >= 10):
		speed_unlock_button.hide()
		speed_increase_button.show()
		Globals.power_up_speed_unlocked = true
		Globals.power_up_speed_available = true
		Globals.total_nut_counter = Globals.total_nut_counter - 10


func _on_speed_increase_button_pressed() -> void:
	if (Globals.total_nut_counter >= 10 && Globals.power_up_speed_unlocked):
		Globals.total_nut_counter = Globals.total_nut_counter - 10
		Globals.speed_power_up_percentage = Globals.speed_power_up_percentage + 0.1

func _on_invis_increase_button_pressed() -> void:
		if (Globals.total_nut_counter >= 10 && Globals.power_up_invis_unlocked):
			Globals.total_nut_counter = Globals.total_nut_counter - 10
			Globals.invis_power_up_time = Globals.invis_power_up_time + 0.1
			
