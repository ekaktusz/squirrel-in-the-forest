extends Node

enum NpcType { STATIC, UP_DOWN, SIDE_TO_SIDE, FOLLOW }
enum NpcColor {BLUE, WHITE, RED}
enum SquirrelState {NORMAL, SPEEDY, INVISIBLE}
enum RelicType {Speed, Invisibility, Shield, Reveal}

var current_level_number: int = 0

var total_nut_counter: int = 100

var power_up_speed_available = true
var power_up_invis_available = true

var power_up_speed_unlocked = false
var power_up_invis_unlocked = false

var speed_power_up_percentage = 1.5
var invis_power_up_time = 1

# to do add state manager later if need
var hiding = false
var able_to_hide = false
var ready_to_evacuate: bool = false
var in_start_area: bool = false

func collect_nut():
	total_nut_counter += 1

func lose_nut():
	if total_nut_counter >1:
		total_nut_counter -= 1
