extends Node

enum NpcType { STATIC, UP_DOWN, SIDE_TO_SIDE, FOLLOW }
enum NpcColor {BLUE, WHITE, RED}
enum SquirrelState {NORMAL, SPEEDY, INVISIBLE}

var total_nut_counter: int = 100
var changing_level: bool = false

var speed = 150
const acceleration = 50
const friction = 30

var power_up_speed_unlocked = false
var power_up_invis_unlocked = false

var power_up_speed_available = false
var power_up_invis_available = false

var speed_power_up_percentage = 1.5
var invis_power_up_time = 1

#to do add state manager later if need
var hiding = false
var able_to_hide = false
var ready_to_evacuate: bool = false
var in_start_area: bool = false

func collect_nut():
	total_nut_counter += 1

func lose_nut():
	if total_nut_counter >1:
		total_nut_counter -= 1
