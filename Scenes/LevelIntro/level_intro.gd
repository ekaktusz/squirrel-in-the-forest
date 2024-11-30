extends Node2D

@onready var ability_description: RichTextLabel = $UpgradeWindow/AbilityDescription

@onready var relic_1: Control = $UpgradeWindow/Relic1
@onready var relic_2: Control = $UpgradeWindow/Relic2

var selected_relic: Control = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ability_description.visible = false
	
	var random_relic_types = get_two_different_random_relic_values()
	relic_1.set_type(random_relic_types[0])
	relic_2.set_type(random_relic_types[1])

func get_two_different_random_relic_values() -> Array:
	var enum_values = Globals.RelicType.values()
	
	var first_value = enum_values[randi() % enum_values.size()]
	
	var remaining_values = enum_values.duplicate()
	remaining_values.erase(first_value)
	
	var second_value = remaining_values[randi() % remaining_values.size()]
	
	return [first_value, second_value]

func select_relic(relic: Control) -> void:
	if selected_relic == relic:
		return  # Already selected

	if selected_relic:
		# Reset the outline of the previously selected relic
		selected_relic.unselect()

	relic.select()

	selected_relic = relic

# Mouse hover handling
func _on_relic_1_mouse_entered() -> void:
	ability_description.text = relic_1.get_description()
	ability_description.visible = true

func _on_relic_2_mouse_entered() -> void:
	ability_description.text = relic_2.get_description()
	ability_description.visible = true

func _on_relic_1_mouse_exited() -> void:
	ability_description.visible = false

func _on_relic_2_mouse_exited() -> void:
	ability_description.visible = false


func _on_relic_1_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		select_relic(relic_1)


func _on_relic_2_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		select_relic(relic_2)
