extends Node

enum NpcType { STATIC, UP_DOWN, SIDE_TO_SIDE, FOLLOW }

var total_nut_counter: int = 0
var level_nut_counter: int = 0
var ready_to_evacuate: bool = false
var speed = 150
const acceleration = 50
const friction = 20

var power_up_speed_available = true
var power_up_invis_available = false

#to do add state manager later if need
var hiding = false
var able_to_hide = false

func collect_nut():
	total_nut_counter += 1
	level_nut_counter += 1
	if (level_nut_counter >= 3):
		ready_to_evacuate = true

func lose_nut():
	level_nut_counter -= 1
