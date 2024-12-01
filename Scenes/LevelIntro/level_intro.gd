extends Node2D

@onready var ability_description: RichTextLabel = $UpgradeWindow/AbilityDescription

@onready var relic_1: Control = $UpgradeWindow/Relic1
@onready var relic_2: Control = $UpgradeWindow/Relic2
@onready var start_button: Button = $StartButton

@onready var level_title_label: Label = $LevelTitleLabel

@onready var mini_map: TextureRect = $ScrollContainer/MarginContainer/VBoxContainer/HBoxContainer/MarginContainer/MiniMap
@onready var mission_label_1: RichTextLabel = $ScrollContainer/MarginContainer/VBoxContainer/HBoxContainer/MissionLabel1
@onready var mission_label_2: RichTextLabel = $ScrollContainer/MarginContainer/VBoxContainer/MissionLabel2

@onready var back_button: Button = $BackButton

var selected_relic: Control = null
var typing_speed: float = 0.00005  # Time delay between characters

func _ready() -> void:
	ability_description.visible = false
	
	var random_relic_types = get_two_different_random_relic_values()
	relic_1.set_type(random_relic_types[0])
	relic_2.set_type(random_relic_types[1])
	
	level_title_label.text = "Level " + str(Globals.current_level_number)
	
	var level_details = LevelIntroDetails.intro_details[Globals.current_level_number]
	mini_map.texture = level_details.mini_map
	
	mission_label_1.bbcode_text = level_details.description_1
	mission_label_2.bbcode_text = level_details.description_2
	
	mission_label_1.visible_characters = 0
	mission_label_2.visible_characters = 0
	
	# Start typewriter effect for mission descriptions
	typewriter_effect(mission_label_1, func():
		typewriter_effect(mission_label_2, func():
			print("asd")
		)
	)

func typewriter_effect(label: RichTextLabel, on_complete: Callable) -> void:
	label.visible_characters = 0  # Start with no characters visible
	var total_characters = label.get_total_character_count()  # Get the total character count
	for i in range(total_characters):
		label.visible_characters = i + 1  # Show one more character each step
		await get_tree().create_timer(typing_speed).timeout  # Wait for the timer
	if on_complete:
		on_complete.call_deferred()  # Call the callback if it exists

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
	ability_description.visible = true
	ability_description.text = relic.get_description()
	
	start_button.disabled = false
	
	selected_relic = relic
	

func _on_relic_1_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		select_relic(relic_1)
		

func _on_relic_2_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		select_relic(relic_2)
		
func _on_start_button_pressed() -> void:
	Globals.selected_power_up = selected_relic.type
	SceneTransition.change_scene("res://Scenes/Levels/level_" + str(Globals.current_level_number) + ".tscn")

func _on_back_button_pressed() -> void:
	SceneTransition.change_scene("res://Scenes/LevelSelector/level_selector.tscn")
