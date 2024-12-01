extends CanvasLayer
@onready var total_nut: Label = $TotalNut
@onready var level_progress: Label = $LevelProgress
@onready var life: Label = $Life
@onready var ability: Label = $Ability
@onready var current_relic: Node2D = $CurrentRelic


func _ready() -> void:
	total_nut.text = "Nuts collected: " + str(Globals.total_nut_counter)
	level_progress.text = "Nuts on level: " + str(Globals.current_level_collected_nuts) + "/" + str(Globals.current_level_no_of_nuts)
	life.text = "Lives: " + str(Globals.remaining_life) + "/3"
	
	if (Globals.selected_power_up == Globals.RelicType.Speed or Globals.selected_power_up == Globals.RelicType.Invisibility):
		ability.text = "Press E to use"
	else:
		ability.text = ""

func _process(delta: float) -> void:
	if Globals.power_up_used:
		ability.text = ""
		current_relic.texture_rect.modulate = Color(0.5, 0.5, 0.5, 1)  # Darker by reducing RGB values
