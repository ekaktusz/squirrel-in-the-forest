extends Node

enum NpcType { STATIC, UP_DOWN, SIDE_TO_SIDE, FOLLOW }
enum SquirrelState {NORMAL, SPEEDY, INVISIBLE}

var total_nut_counter: int = 0
var level_nut_counter: int = 0
var changing_level: bool = false

var speed = 150
const acceleration = 50
const friction = 30

var power_up_speed_available = true
var power_up_invis_available = true

#to do add state manager later if need
var hiding = false
var able_to_hide = false
var ready_to_evacuate: bool = false
var in_start_area: bool = false

func collect_nut():
	total_nut_counter += 1
	level_nut_counter += 1
	if (level_nut_counter >= 3):
		ready_to_evacuate = true

func lose_nut():
	if level_nut_counter >1:
		level_nut_counter -= 1
