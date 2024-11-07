extends Node

enum NpcType { STATIC, UP_DOWN, SIDE_TO_SIDE, FOLLOW }

var nut_counter: int = 0

const speed = 150
const acceleration = 50
const friction = 20

#to do add state manager later if need
var hiding = false
var able_to_hide = false

func collect_nut():
	nut_counter += 1

func lose_nut():
	nut_counter -= 1
