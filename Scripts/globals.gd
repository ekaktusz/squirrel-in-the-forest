extends Node


var nut_counter: int = 0
const speed = 50
const acceleration = 25
const friction = 10

func collect_nut():
	nut_counter += 1

func lose_nut():
	nut_counter -= 1
